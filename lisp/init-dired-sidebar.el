;;; init-dired-sidebar.el --- directory/file tree browser -*- lexical-binding: t; -*-

;;; Commentary:

;; Treemacs is more project oriented. Dired-sidebar will explore the
;; whole file system without regard to project structure.

;;; Code:

(use-package dired-sidebar
  :ensure t
  :after dired
  :custom
  (dired-sidebar-them     'nerd)
  (dired-sidebar-should-follow-file  nil)  ;; nil is default, here for visibility
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :commands (dired-sidebar-toggle-sidebar))

;; TODO: Consolidate key bindings.

(provide 'init-dired-sidebar)

;;; init-dired-sidebar.el ends here.
