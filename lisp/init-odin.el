;;; init-odin.el --- Configure various placeholders -*- lexical-binding: t; -*-

;;; Commentary:

;; Odin support isn't available via ELPA yet. I have cloned the
;; repositories under my `site-lisp/' directory. All of this are in
;; varying states of development.

;; Trying out odin-ts-mode.

;;; Code:

(require 'odin-ts-mode)

(add-to-list 'auto-mode-alist '("\\.odin\\'" . odin-ts-mode))

(with-eval-after-load 'eglot
  (add-to-list
   'eglot-server-programs
   '(odin-ts-mode . ("ols"))))

(provide 'init-odin)

;;; init-odin.el ends here.
