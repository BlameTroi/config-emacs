;;; init-markdown.el --- Configure various placeholders -*- lexical-binding: t; -*-

;;; Commentary:

;; Built in Markdown support is in mid flight. Emacs 31 has an
;; experimental `markdown-ts-mode' but no basic `markdown-mode'. I
;; would rather not experiment with the `ts' version so I am using
;; jblevins' `markdown-mode' from melpa-stable.

;;; Code:


(use-package markdown-mode
  :ensure t
  :defer t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "cmark-gfm")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))

(provide 'init-markdown)

;;; init-markdown.el ends here.
