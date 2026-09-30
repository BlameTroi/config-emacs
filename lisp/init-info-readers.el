;;; init-info-readers.el --- Info, man, etc. -*- lexical-binding: t; -*-

;;; Commentary:

;; There are some path dependencies for info.

;;; Code:

(use-package info
  :after exec-path-from-shell
  :custom
  (Info-additional-directory-list '("/opt/homebrew/share/info")))

(use-package man
  :after exec-path-from-shell
  :commands (man)
  :custom
  (Man-notify-method 'pushy)) ; does not obey `display-buffer-alist'

(provide 'init-info-readers)

;;; init-info-readers.el ends here.
