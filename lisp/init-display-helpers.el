;;; init-display-helpers.el --- Guide the eye -*- lexical-binding: t; -*-

;;; Commentary:

;; Various eye catching highlighters.

;;; Code:

;; Make page breaks more visible.

(use-package form-feed-st
  :ensure t
  :diminish
  :hook (prog-mode text-mode help-mode))

;;; Hl-todo:

(use-package hl-todo
  :ensure t
  :hook (prog-mode . hl-todo-mode)
  :bind (:map hl-todo-mode-map
              ("C-c tp" . hl-todo-previous)
              ("C-c tn" . hl-todo-next)
              ("C-c to" . hl-todo-occur)
              ("C-c ti" . hl-todo-insert)))

;; Highlight the cursor line.

(use-package hl-line
  :hook
  (emacs-startup-hook . global-hl-line-mode)
  :init
  (add-hook 'global-hl-line-mode-hook
            (lambda()
              (set-face-attribute
               'hl-line nil
               :inherit 'highlight
               :extend t
               :underline nil
               :background "LightGoldenrod2"
               :foreground "black"))))

;; Hilight in occur. I probably need to add a few others modes.

(add-hook 'occur-mode-hook #'hl-line-mode)

(use-package so-long
  :hook
  (emacs-startup . global-so-long-mode))

(provide 'init-display-helpers)

;;; init-display-helpers.el ends here.
