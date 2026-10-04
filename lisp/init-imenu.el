;;; init-imenu.el --- Use imenu to extend dired and other navigation -*- lexical-binding: t; -*-

;;; Commentary:


;;; Code:

(use-package dired-imenu
  :ensure t
  :after dired)

;; Show the current buffer's imenu entries in a separate buffer
(use-package imenu-list
  :ensure t
  :after eglot
  :config
  (setq imenu-list-focus-after-activation t)
  (global-set-key (kbd "C-.") #'imenu-list-minor-mode)
)
(provide 'init-imenu)

;;; init-imenu.el ends here.
