;;; init-which-free-keys.el --- Discover Keys -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package which-key
  :diminish
  :config
  (which-key-mode t))

(use-package free-keys
  :ensure t
  :diminish)

(provide 'init-which-free-keys)

;;; init-which-free-keys.el ends here.
