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

(with-eval-after-load 'odin-mode
  (add-hook 'odin-mode-hook
            (apply-partially #'troi/indenture +1 8))
  (setq-local js-indent-level 8)) ; odin uses js-indent and many other things

(provide 'init-odin)

;;; init-odin.el ends here.
