;;; init-confusion.el --- Enable blocked commands -*- lexical-binding: t; -*-

;;; Commentary:

;; The Emacs maintainers have disabled several so-called confusing
;; commands. I prefer that there be no training wheels on my Emacs.

;;; Code:

;; 'put' is used because these are properties of the function name
;; symbol.

(put 'scroll-left 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(provide 'init-confusion)

;;; init-confusion.el ends here.
