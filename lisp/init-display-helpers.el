;;; init-display-helpers.el --- Guide the eye -*- lexical-binding: t; -*-

;;; Commentary:

;; Various visual tweaks to guide the eye.
;; - Highlight the active line.
;; - Call out TODO items.
;; - C-q C-l as a horizontal rule.
;; - Dim inactive windows slightly.

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

;; Dim inactive windows.

;; This package works well with the Acme theme, but not all others.

(use-package dimmer
  :ensure t
  :custom
  (dimmer-fraction 0.33)         ;; reduce brightness by
  :config
  (dimmer-configure-which-key)   ;; configure the popups and such
  (dimmer-configure-magit)       ;; that should not trigger a change
  (dimmer-configure-org)         ;; in brightness
  (dimmer-mode t))

;; So-long doesn't seem to fit anywhere else.

(use-package so-long
  :hook
  (emacs-startup . global-so-long-mode))

;; TODO: These may be useful but they are almost invisible using the
;; Acme theme.

;; ;; Experimental highlight word or symbol at point. This may be too
;; ;; noisy.
;; 
;; ;; Highlights the word/symbol at point and any other occurrences in
;; ;; view. Also allows to jump to the next or previous occurrence.
;; ;; https://github.com/nschum/highlight-symbol.el
;; (use-package highlight-symbol
;;   :ensure t
;;   :config
;;   (setq highlight-symbol-on-navigation-p t)
;;   (add-hook 'prog-mode-hook 'highlight-symbol-mode))
;; 
;; ;; Also experimental and maybe too noisy.
;; 
;; ;; Emacs minor mode that highlights numeric literals in source code.
;; ;; https://github.com/Fanael/highlight-numbers
;; (use-package highlight-numbers
;;   :ensure t
;;   :config
;;   (add-hook 'prog-mode-hook 'highlight-numbers-mode))

(provide 'init-display-helpers)

;;; init-display-helpers.el ends here.
