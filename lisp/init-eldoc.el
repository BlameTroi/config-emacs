;;; init-eldoc.el --- Enable eldoc and popups -*- lexical-binding: t; -*-

;;; Commentary:

;; One document api to show them all. eldoc-box is pretty handy since
;; I don't like the mini-buffer fluttering up and down.

;;; Code:

(use-package eldoc
  :after eglot
  :diminish
  :init (global-eldoc-mode))

(use-package eldoc-box
  :ensure t
  :after eldoc
  :pin melpa
  :diminish
  :bind (:map prog-mode-map
              ("C-h D" . eldoc-box-help-at-point))
  :config
  (setopt eldoc-echo-area-prefer-doc-buffer t)
  (setopt eldoc-echo-area-use-multiline-p nil)
  :custom-face
   (eldoc-box-body ((t (:background "light green"))))
   (eldoc-box-border ((t (:background "DarkGoldenrod4")))))

(provide 'init-eldoc)

;;; init-eldoc.el ends here.
