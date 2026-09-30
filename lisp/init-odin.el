;;; init-odin.el --- Configure various placeholders -*- lexical-binding: t; -*-

;;; Commentary:

;; Odin support isn't available via ELPA yet. I have cloned the
;; repositories under my `site-lisp/' directory. All of this are in
;; varying states of development.

;;; Code:

(require 'odin-mode) ;; adds .odin to mode alist

(with-eval-after-load 'eglot
  (add-to-list
   'eglot-server-programs
   '(odin-mode . ("ols"))))

(provide 'init-odin)

;;; init-odin.el ends here.
