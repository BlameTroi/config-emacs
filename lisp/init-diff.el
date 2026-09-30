;;; init-diff.el --- See diffs and possibly merge or create patches -*- lexical-binding: t; -*-

;;; Commentary:

;; Ediff is a helpful UI over standard file diff and patch tools.

;;; Code:

(use-package ediff
  :custom
  (ediff-split-window-function 'split-window-horizontally)
  (ediff-window-setup-function 'ediff-setup-windows-plain)
  (ediff-keep-variants nil)
  (ediff-make-buffers-readonly-at-startup nil)
  (ediff-merge-revisions-with-ancestor t)
  (ediff-show-clashes-only t))

(use-package diff-mode
  :custom
  (diff-default-read-only t))

(use-package diff-hl
  :ensure t
  :hook ('emacs-startup-hook . 'global-diff-hl-mode))

(provide 'init-diff)

;;; init-diff.el ends here.
