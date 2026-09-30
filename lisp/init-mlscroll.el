;;; init-mlscroll.el --- A pseudo scroll bar in the mode line -*- lexical-binding: t; -*-

;;; Commentary:

;; I only use the scroll bar as a visual clue to my position in
;; a buffer.

;;; Code:

(use-package mlscroll
  :ensure t
  :config
  (setq mlscroll-shortfun-min-width 11) ; truncate which-func
  :hook
  (emacs-startup . (lambda ()
                     (which-function-mode)
                     (mlscroll-mode 1))))

(provide 'init-mlscroll)

;;; init-mlscroll.el ends here.
