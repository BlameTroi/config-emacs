;;; init-shell.el --- Shell and terminal inside emacs -*- lexical-binding: t; -*-

;;; Commentary:

;; History and similar files for eshell are excluded via .gitignore. I
;; still need to set up aliases.

;;; Code:

(use-package eshell
  :defer)

;; Eat: Emulate A Terminal.

(use-package eat
  :ensure t
  :defer
  :custom
  (eat-term-name "xterm")
  :config
  (eat-eshell-mode)                 ;; use Eat to handle term codes in program output
  (eat-eshell-visual-command-mode)) ;; commands like less will be handled by Eat

(provide 'init-shell)

;;; init-shell.el ends here.
