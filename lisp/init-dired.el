;;; init-dired.el --- Directory edits -*- lexical-binding: t; -*-

;;; Commentary:

;; Basic dired but use `gls' since the Mac `ls' doesn't support dired.

;;; Code:

(use-package dired
  :after exec-path-from-shell
  :commands (dired)
  :init
  (when (executable-find "gls")    ; use GNU ls
    (message "dired using gls")
    (setopt
     dired-use-ls-dired nil
     ls-lisp-use-insert-directory-program t
     insert-directory-program "gls"
     dired-listing-switches "-alh --group-directories-first"))
  :custom
  (dired-recursive-copies 'always)
  (dired-isearch-filenames 'dwim)
  (dired-recursive-deletes 'always)
  (dired-kill-when-opening-new-dired-buffer t)
  (delete-by-moving-to-trash t)
  (dired-dwim-target t)
  (dired-auto-revert-buffer t)
  (dired-do-revert-buffer t)
  (dired-free-space 'separate)
  (shell-command-prompt-show-cwd t))

(provide 'init-dired)

;;; init-dired.el ends here.
