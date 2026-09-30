;;; init-mouse.el --- Disable the mouse/touchpad -*- lexical-binding: t; -*-

;;; Commentary:

;; I had a hack that I used in early-init but this works better.

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
