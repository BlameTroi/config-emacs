;;; init-memory.el --- History, recent files, etc. -*- lexical-binding: t; -*-

;;; Commentary:

;; Recentf, savehist, saveplace, autorevert, undo-tree, bookmarking.

;;; Code:

(use-package recentf
  :config
  (recentf-mode)
  :custom
  (recentf-max-menu-items 64)
  (recentf-max-saved-items 64))

(use-package savehist
  :config
  (savehist-mode)
  :custom
  (savehist-additional-variables
   '(compile-command
     kill-ring
     regexp-search-ring))
  (history-length 128)
  (history-delete-duplicates t)
  (savehist-save-minibuffer-history t))

(use-package saveplace
  :config
  (save-place-mode)
  :custom
  (save-place-limit 512))

(use-package autorevert
  :config
  (global-auto-revert-mode +1)
  :custom
  (auto-revert-avoid-polling t)
  (global-auto-revert-non-file-buffers t)
  (auto-revert-verbose t))

(use-package undo-tree
  :ensure t
  :diminish
  :config (global-undo-tree-mode)
  :custom
  (undo-tree-auto-save-history nil)
  (undo-tree-visualizer-diff t))

(use-package bookmark
  :hook (bookmark-bmenu-mode . hl-line-mode)
  :custom
  (bookmark-save-flag 1)
  (register-preview-delay 0.8))


(provide 'init-memory)

;;; init-memory.el ends here.
