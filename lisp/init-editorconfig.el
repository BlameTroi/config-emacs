;;; init-editorconfig.el --- I can't escape it -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package editorconfig
  :hook
  (prog-mode . editorconfig-mode)
  (text-mode . editorconfig-mode))

(provide 'init-editorconfig)

;;; init-editorconfig.el ends here.
