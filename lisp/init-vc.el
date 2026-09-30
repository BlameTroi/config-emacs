;;; init-vc.el --- Version Control -*- lexical-binding: t; -*-

;;; Commentary:

;; My standard `early-init.el' disables all backends except for git.
;; This is a speeds up Emacs initialize. I do not re-enable them since
;; I only use git. If I use another backend (fossil is a possibility) I
;; will need to add that as well.

;;; Code:

;; Common settings for all backends.

(use-package vc
  :custom
  (vc-auto-revert-mode t)
  (vc-deduce-backend-nonvc-modes t)
  (vc-dir-save-some-buffers-on-revert t)
  (vc-find-revision-no-save t)
  (vc-follow-symlinks t)
  (vc-use-incoming-outgoing-prefixes t))

;; Git specific.

;; This is a minimal `magit' setup.

;; The following warning is generated on startup and I have not found a
;; way to quash it. There is no `unspecified' that I can find. I do not
;; know if this is caused by something missing in the Acme theme.

;; Warning: setting attribute ‘:background’ of face ‘magit-diff-context’: nil value is invalid, use ‘unspecified’ instead.

(use-package magit
  :ensure t
  :commands (magit-init
             magit-status)
  :bind ("C-x g" . magit-status))

(provide 'init-vc)

;;; init-vc.el ends here.
