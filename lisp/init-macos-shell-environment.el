;;; init-macos-shell-environment.el --- Desktop Mac does not start with the correct shell environment -*- lexical-binding: t; -*-

;;; Commentary:

;; Darwin/MacOS runs Emacs as a GUI process and it does not have the
;; same $PATH or other environment variables that any process running
;; under a shell would get. Examples are any editor started from a
;; command line and automated builds.

;; Get the correct path and environment variable values as if this
;; were a login shell. The variable list is hard coded and specific to
;; my needs.

;;; Code:

;; If this takes more than 0.5 seconds a warning will be printed. This
;; can be ignored. I don't restart Emacs frequently and I don't feel a
;; need to make the changes recommended in the README.

(when-running-on-macos
 (use-package exec-path-from-shell
   :ensure t
   :config
   (declare-function
    exec-path-from-shell-initialize "exec-path-from-shell" ())
   (setopt
    exec-path-from-shell-variables
    '(
      ;; Old style Makefile variables for C. I probably don't need
      ;; these anymore.
      "LIBRARY_PATH"
      "CPATH"
      "CDPATH"

      ;; Environment variables specific to compile and build for any
      ;; languages I'm working with.
      "CMAKE_GENERATOR"
      "ODIN_ROOT"

      ;; Where is the documentation? I know MANPATH is not used on all
      ;; operating systems, but it doesn't cause me problems to get it.
      "INFOPATH"
      "MANPATH"

      ;; Apple's libc malloc library emits some informational warnings
      ;; specific to particular allocation pools. They do me no good.
      "MallocNanoZone"
      ))
   (exec-path-from-shell-initialize)))

(provide 'init-macos-shell-environment)

;;; init-macos-shell-environment.el ends here.
