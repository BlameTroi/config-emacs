;;; init-vc.el --- Configure various placeholders -*- lexical-binding: t; -*-

;;; Commentary:

;; My standard `early-init.el' disables all backends except for git.
;; This is a startup speed up. I do not re-enable them since I only
;; use git. I may add fossil at some point.

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

;; This is from the magit package.

;; This is a minimal `magit' setup.

;; The following warning is generated on startup and I have not found a
;; way to quash it. There is no `unspecified' that I can find.

;; Warning: setting attribute ‘:background’ of face ‘magit-diff-context’: nil value is invalid, use ‘unspecified’ instead.

(use-package magit
  :ensure t
  :commands (magit-init
             magit-status)
  :bind ("C-x g" . magit-status))

(provide 'init-vc)

;;; init-vc.el ends here.
