;;; init-lisps.el --- Lisp and Scheme -*- lexical-binding: t; -*-

;;; Commentary:

;; I do more Scheme than Lisp.

;; I had looked at using `lispy' for structural editing but abo-abo
;; isn't active anymore and while there is a fork I'll use the old
;; standby `paredit'.

;;; Code:

;; Editing.

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package paredit
  :ensure t)

;; Documentation.

(use-package srfi
  :ensure t)

(use-package sicp
  :ensure t)

;; Geiser.

(use-package geiser
  :ensure t)

;; Guile.

(use-package geiser-guile
  :ensure t
  :after geiser)

(use-package flymake-guile
  :ensure t
  :after geiser-guile)

;; Other schemes.

;; When I last tried, Geiser and Chicken don't work well together. For
;; non-Guile work I'm going to use the classic Scheme mode. It is less
;; sophisticated than Geiser but it works.

;; Here are my notes from a prior configuration for Chicken.

;; These are the built-in Scheme packages.
;; (require 'scheme)
;; (require 'cmuscheme)
;; (setopt scheme-program-name "csi -:c")

;; `scheme-complete' is a package on elpa.

;; (use-package scheme-complete
;;   :ensure t)
;; (setopt *scheme-use-r7rs* nil)
;; (setopt scheme-mit-dialect nil)
;; (setopt scheme-default-implementation 'chicken)

(provide 'init-lisps)

;;; init-lisps.el ends here.
