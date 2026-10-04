;;; init-whitespace.el --- Show what is hidden -*- lexical-binding: t; -*-

;;; Commentary:

;; Whitespace-mode is built in. Ws-butler is not. It does not seem to be
;; working everywhere I think it should.

;; NOTE: When I get ws-butler working I need to make sure it is not
;; active in markdown modes.

;;; Code:

(use-package whitespace
  :diminish
  :custom
  (whitespace-style '(face tabs tab-mark trailing))
  (whitespace-display-mappings
   '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
  :custom-face
  (whitespace-tab ((t (:foreground "#636363"))))
  :hook
  (prog-mode . whitespace-mode)
  (before-save . whitespace-cleanup))

;; ;; This will also show trailing characters as they are useful to spot.
;; (setq whitespace-style '(face tabs tab-mark trailing))
;; ;; TODO: convert to `:custom-face' or `set-face-attribute'.
;; (custom-set-faces
;;  '(whitespace-tab ((t (:foreground "#636363")))))
;; (setq whitespace-display-mappings
;;   '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
;; (global-whitespace-mode) ; Enable whitespace mode everywhere

;; Trailing spaces are evil. One reason I don't like Markdown is that
;; trailing spaces are significant. I only turn this on automatically
;; for programming modes. Prose and data are under manual control.

;; See variable `ws-butler-global-exempt-modes' for modes that are
;; exclude. It's current default is: _(special-mode minibuffer-mode
;; comint-mode term-mode eshell-mode diff-mode markdown-mode)_.

;; (use-package ws-butler
;;   :ensure t
;;   :diminish "wsb"
;;   :hook (prog-mode . ws-butler-mode))

(provide 'init-whitespace)

;;; init-whitespace.el ends here.
