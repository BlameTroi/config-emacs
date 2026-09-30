;;; init-dimmer.el --- Visual hints -*- lexical-binding: t; -*-

;;; Commentary:

;; Dimmer will fade out inactive windows.

;;; Code:

(use-package dimmer
  :ensure t
  :custom
  (dimmer-fraction 0.33)         ;; reduce brightness by
  :config
  (dimmer-configure-which-key)   ;; configure the popups and such
  (dimmer-configure-magit)       ;; that should not trigger a change
  (dimmer-configure-org)         ;; in brightness
  (dimmer-mode t))

(provide 'init-dimmer)

;;; init-dimmer.el ends here.
