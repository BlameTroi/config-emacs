;;; init-nerd.el --- Nerd and other icon related things -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package nerd-icons
  :ensure t
  :diminish
  :custom
  (nerd-icons-font-family "Symbols Nerd Font Mono"))

(use-package nerd-icons-ibuffer
  :ensure t
  :after (nerd-icons ibuffer)
  :diminish
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package nerd-icons-dired
  :ensure t
  :after (dired nerd-icons)
  :diminish
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-corfu
  :ensure t
  :after (corfu nerd-icons))

(use-package nerd-icons-completion
  :ensure t
  :after (nerd-icons marginalia)
  :diminish
  :config
  (nerd-icons-completion-mode) ; was under hook to emacs-startup-hook
  :hook
  (marginalia-mode . nerd-icons-completion-marginalia-setup))

(use-package kind-icon
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(provide 'init-nerd)

;;; init-nerd.el ends here.
