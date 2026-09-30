;;; init-spelling.el --- Flyspell and ??? -*- lexical-binding: t; -*-

;;; Commentary:

;; A basic flyspell configuration. At some point I should add a
;; thesaurus and web lookup. I got most of this from James Cherti's
;; site:

;; URL: https://www.jamescherti.com/emacs-spell-checker-flyspell-ispell-aspell/

;;; Code:

;; Set the ispell program name to aspell
;; (switching to aspell will generally offer better performance than
;; ispell.)

(setq ispell-program-name "aspell")

;; Set the global default dictionary for the Ispell process.
(setq ispell-dictionary "en_US")

;; Reduce unnecessary messages when checking individual words.
(setq ispell-quietly t)

;; Configure Aspell's suggestion mode to "ultra", which favors very
;; close spelling and phonetic matches when generating suggestions.
(setq ispell-extra-args '("--sug-mode=ultra"))

(defun troi/flyspell-prog-mode (&rest _args)
  "Enable `flyspell-prog-mode' with buffer-local Aspell arguments."
  ;; The --run-together flag instructs Aspell to accept words formed
  ;; by combining two or more valid dictionary words without spaces,
  ;; treating the resulting string as valid.

  ;; This is excellent for source code. Code is heavily populated with
  ;; compound variable names and technical terms (e.g., filepath,
  ;; buffername, checkbox).
  (make-local-variable 'ispell-extra-args)
  (dolist (item '("--run-together"
                  ;; "--ignore=2"
                  ;; "--run-together-min=3"
                  ;; "--run-together-limit=4"
                  ;; "--camel-case"
                  ))
    (add-to-list 'ispell-extra-args item))
  (flyspell-prog-mode))

;; The flyspell package is a built-in Emacs minor mode that provides
;; on-the-fly spell checking. It highlights misspelled words as you
;; type, offering interactive corrections.
(defun my/flyspell-enable-appropriate-mode ()
  "Enable the appropriate Flyspell mode based on the current major
mode."
  (if (or (derived-mode-p 'conf-mode)
          (derived-mode-p 'yaml-mode)
          (derived-mode-p 'yaml-ts-mode)
          (derived-mode-p 'ansible-mode)
          (derived-mode-p 'nxml-mode)
          (derived-mode-p 'sgml-mode))
      (troi/flyspell-prog-mode)
    (flyspell-mode 1)))

(add-hook 'prog-mode-hook #'troi/flyspell-prog-mode)
(add-hook 'conf-mode-hook #'troi/flyspell-enable-appropriate-mode)
(add-hook 'text-mode-hook #'troi/flyspell-enable-appropriate-mode)

(use-package flyspell
  ;; :bind
  ;; (:map flyspell-mode-map
  ;;       ("C-;" . nil)
  ;;  :map flyspell-mouse-map
  ;;       ("<mouse-3>" . flyspell-correct-word)
  ;;  :map ctl-x-x-map
  ;;       ("s" . flyspell-mode)) ; C-x x s
  :custom
  (flyspell-issue-message-flag nil)
  (flyspell-issue-welcome-flag nil)
  (ispell-dictionary "en_US")
  (flyspell-mode-line-string " SP"))

(provide 'init-spelling)

;;; init-spelling.el ends here.
