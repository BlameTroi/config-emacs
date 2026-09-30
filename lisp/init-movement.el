;;; init-movement.el --- Quick movement -*- lexical-binding: t; -*-

;;; Commentary:

;; Movement and navigation aids.

;;; Code:

;; Visual jump to transient markers. The cuctom setting limits the
;; range to the current window.

(use-package avy
  :ensure t
  :diminish avy-mode
  :bind (("C-c j" . avy-goto-line)
         ("s-j"   . avy-goto-char-timer))
  :custom
  (avy-all-windows nil))

;; Visual jump to transient markers. The aw-keys  keeps your fingers
;; on the home keys.

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; TODO: dumbjump, xref.
;; (require 'dumb-jump)
;; (add-hook 'xref-backend-functions-hook #'dumb-jump-xref-activate)

(provide 'init-movement)

;;; init-movement.el ends here.
