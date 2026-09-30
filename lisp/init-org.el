;;; init-org.el --- A minimal org setup -*- lexical-binding: t; -*-

;;; Commentary:

;; This is a minimal setup. I don't expect to do a lot of work in org.

;;; Code:


(use-package org
  :ensure t
  :defer t
  :mode ("\\.org\\'" . org-mode)
  :init
  (setq org-dir (substitute-in-file-name "$HOME/org"))
  (if (not (file-directory-p org-dir))
      (make-directory org-dir))
  :hook
  (org-mode . org-indent-mode)
  (org-mode . visual-line-mode)
  (org-mode . variable-pitch-mode)
  :custom
  (org-directory org-dir)
  (org-agenda-files org-dir)
  (org-log-done 'time)
  (org-return-follows-link t)
  ;;(setopt org-hide-emphasis-markers t)
  ;; some sample keybinds and a template to use for use-package
  ;; :bind (:map
  ;;        corfu-map
  ;;        ("SPC" . corfu-insert-separator)
  ;;        ("C-n" . corfu-next)
  ;;        ("C-p" . corfu-previous))
  ;; ;; Remap the change priority keys to use the UP or DOWN key
  ;; (define-key org-mode-map (kbd "C-c <up>") 'org-priority-up)
  ;; (define-key org-mode-map (kbd "C-c <down>") 'org-priority-down)
  ;; ;; Shortcuts for storing links, viewing the agenda, and starting a capture
  ;; (define-key global-map "\C-cl" 'org-store-link)
  ;; (define-key global-map "\C-ca" 'org-agenda)
  ;; (define-key global-map "\C-cc" 'org-capture)
  ;; ;; When you want to change the level of an org item, use SMR
  ;; (define-key org-mode-map (kbd "C-c C-g C-r") 'org-shiftmetaright)
  )

(use-package org-modern
  :ensure t
  :after org
  :defer t)

(use-package org-bullets
  :ensure t
  :after org-modern
  :defer t)

(provide 'init-org)

;;; init-org.el ends here.
