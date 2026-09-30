;;; init-project.el --- Basic project management -*- lexical-binding: t; -*-

;;; Commentary:

;; I have no prior history with projectile so I'm going to start with
;; project. Emacs views a project as a grouping of directories and
;; files.

;;; Code:

;; Not projectile. Keep things simple. Emacs views a `project' as a
;; grouping of directories and files.

(use-package project
  :custom
  (project-vc-extra-root-markers
   '(".projectile" ".project.el" "fpm.toml")))

;; (setopt project-switch-commands
;;         '((project-find-file "Find file")
;;           (project-find-regexp "Find regexp")
;;           (project-find-dir "Find directory")
;;           (project-dired "Root dired")
;;           (project-vc-dir "VC-Dir")
;;           (project-shell "Shell")
;;           (keyboard-quit "Quit")))
;; (setq project-key-prompt-style t) ; Emacs 30
;; (advice-add #'project-switch-project
;;             :after #'troi/clear-minibuffer-message)

(provide 'init-project)

;;; init-project.el ends here.
