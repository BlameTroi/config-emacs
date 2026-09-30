;;; init-compile.el --- Compile command -*- lexical-binding: t; -*-

;;; Commentary:

;; This will probably need a good bit of work to support Odin and some
;; other languages.

;;; Code:

(use-package compile
  :custom
  (compilation-scroll-output 'first-error))

(provide 'init-compile)

;;; init-compile.el ends here.
