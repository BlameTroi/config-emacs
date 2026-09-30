;;; init-aliases.el --- For some common M-x commands -*- lexical-binding: t; -*-

;;; Commentary:

;; While I'm as likely to use the full command as not, provide aliases
;; for common M-x entries. At least one other alias can be found in
;; init-emacs.el.

;;; Code:

(defalias 'er 'eval-region)
(defalias 'eb 'eval-buffer)
(defalias 'ed 'eval-defun)
(defalias 'wsm 'whitespace-mode)
(defalias 'fr 'fill-region)

(provide 'init-aliases)

;;; init-aliases.el ends here.
