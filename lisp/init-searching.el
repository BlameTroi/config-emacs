;;; init-searching.el --- Isearch, Grep, Ripgrep, and so on. -*- lexical-binding: t; -*-

;;; Commentary:

;; Basic searching. Writeable grep buffers. The `rg' package is an
;; interface for using `ripgrep'.

;; I should probably replace the `grep' program with `rg'.

;;; Code:

(use-package isearch
  :custom
  (isearch-lazy-count t)
  (isearch-lazy-highlight t)
  (isearch-repeat-on-direction-change t)
  (lazy-count-prefix-format "(%s/%s) ")
  (lazy-count-suffix-format nil)
  (lazy-highlight-initial-delay 0.5)
  (lazy-highlight-no-delay-length 4))

(use-package grep
  :config
  (setq-default grep-highlight-matches t
                grep-scroll-output t))

(use-package wgrep
  :ensure t
  :after grep
  :config
  (setq wgrep-auto-save-buffer t)
  (dolist (key (list (kbd "C-c C-q") (kbd "w")))
    (define-key grep-mode-map key 'wgrep-change-to-wgrep-mode)))

(use-package rg
  :ensure t
  :config
  (global-set-key (kbd "M-?") 'rg-project))

(provide 'init-searching)

;;; init-searching.el ends here.
