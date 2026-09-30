;;; init-fortran.el --- Fortran IV, 77, F90, F95, ... -*- lexical-binding: t; -*-

;;; Commentary:

;; Eglot will use `fortls' with sensible defaults without any additional
;; configuration.

;; Each Fortran based project needs a `.fortlsrc' file in its root.

;; TODO: Does FPM belong here or under project/infrastructure?

;; Flymake will need configuration but I haven't started working on
;; that yet. I may just use Purcell's `flymake-flycheck' wrapper but
;; I'm not sure I want to drag Flycheck along for the ride given my
;; limited use of Fortran at the moment.

;; I created an `f90format' using Purcell's `reformatter'. I need to
;; recover my work and plug it in here. TODO: Find on GitHub.

;;; Code:

(use-package fortran)

(use-package f90)

(provide 'init-fortran)

;;; init-fortran.el ends here.
