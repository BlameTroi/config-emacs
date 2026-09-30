;;; init-cape.el --- Completion at point -*- lexical-binding: t; -*-

;;; Commentary:

;; Completion At PointE. This is highly configurable. I am using
;; the minimalist configuration from Emacs-Bedrock.

;;; Code:

(use-package cape
  :ensure t
  :config
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file))

(provide 'init-cape)

;;; init-cape.el ends here.
