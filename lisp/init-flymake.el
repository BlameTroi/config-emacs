;;; init-flymake.el --- Error reporting -*- lexical-binding: t; -*-

;;; Commentary:

;; I'm currently using only flymake. Steve Purcell has a flycheck to
;; flymake adapter if I end up wanting to use any of the flycheck modules.

;; TODO: Does prog-mode encompass all of these or do I need to have
;; separate hooks?

;; (add-hook 'c-ts-mode-hook 'flymake-mode)
;; (add-hook 'c++-ts-mode-hook 'flymake-mode)
;; (add-hook 'emacs-lisp-mode-hook 'flymake-mode)
;; (add-hook 'odin-mode-hook 'flymake-mode)

;;; Code:

;; A minimal config.

(use-package flymake
  :hook
  (prog-mode . flymake-mode)
  :custom (flymake-mode-line-lighter "FM")
  :bind (:map flymake-mode-map
              ("C-c ! n" . flymake-goto-next-error)
              ("C-c ! p" . flymake-goto-prev-error)
              ("M-n"     . flymake-goto-next-error)
              ("M-p"     . flymake-goto-prev-error)
              ("C-c ! l" . flymake-show-buffer-diagnostics)
              ("C-c ! L" . flymake-show-project-diagnostics)))

;; Flymake needs some tweaking to recognize the current `load-path'
;; when editing elisp.

(use-package flymake-elisp-config
  :ensure t
  :config
  ;; make the load path customizeable for Flymake.
  (flymake-elisp-config-global-mode)
  ;; Automatically set load-path for Flymake.
  (flymake-elisp-config-auto-mode))

(provide 'init-flymake)

;;; init-flymake.el ends here.
