;;; init-shell.el --- Shell and terminal inside emacs -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package eshell
  :init
  (defun troi/setup-eshell ()
    "Make sure C-r is bound in the eshell-mode-map. From Emacs-Bedrock."
    ;; Something funny is going on with how Eshell sets up its keymaps;
    ;; this is a work-around to make C-r bound in the keymap
    (keymap-set eshell-mode-map "C-r" 'consult-history))
  :hook ((eshell-mode . troi/setup-eshell)))

;; Eat: Emulate A Terminal.

(use-package eat
  :ensure t
  :custom
  (eat-term-name "xterm")
  :config
  (eat-eshell-mode)                 ;; use Eat to handle term codes in program output
  (eat-eshell-visual-command-mode)) ;; commands like less will be handled by Eat




(provide 'init-shell)

;;; init-shell.el ends here.
