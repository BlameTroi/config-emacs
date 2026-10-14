;;; init-go.el --- CHANGE ME -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; From go.dev, how to set up gopls in Emacs.

;; Teach project to find the root of a Go project. Apparently eglot
;; uses project for this.

(require 'project)

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(add-hook 'project-find-functions #'project-find-go-module)

;; Wire things up.

;; (use-package go-mode
;;   :ensure t)

(use-package go-snippets
  :ensure t)

(add-hook 'go-ts-mode-hook 'eglot-ensure)

;; Optional: install eglot-format-buffer as a save hook.
;; The depth of -10 places this before eglot's willSave notification,
;; so that notification reports the actual contents that will be saved.
(defun eglot-format-buffer-before-save ()
  (add-hook 'before-save-hook #'eglot-format-buffer -10 t))
(add-hook 'go-mode-hook #'eglot-format-buffer-before-save)

;; Always organize imports on save.

(add-hook 'before-save-hook
          (lambda ()
            (call-interactively 'eglot-code-action-organize-imports))
          nil t)

(provide 'init-go)

;;; init-go.el ends here.
