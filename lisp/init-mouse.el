;;; init-mouse.el --- Configure various placeholders -*- lexical-binding: t; -*-

;;; Commentary:

;; Is this better than my mosue disable hack? I hope so.

;;; Code:

(use-package disable-mouse
  :ensure t
  :custom
  (disable-mouse-mode-lighter nil)
  (global-disable-mouse-mode-lighter nil)
  :config
  (global-disable-mouse-mode))

(provide 'init-mouse)

;;; init-mouse.el ends here.
