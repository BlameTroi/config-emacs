;;; init-vertico.el --- Vertical presentation of completion options -*- lexical-binding: t; -*-

;;; Commentary:

;; Vertico provides a good veritical completion in the minibuffer
;; and related pickers. Be sure that `fido-mode' and its friends are
;; not enabled.

;;; Code:

(use-package vertico
  :ensure t
  :pin melpa
  :config
  (vertico-mode))

(use-package vertico-directory
  :after vertico
  :bind (:map vertico-map
              ("M-DEL" . vertico-directory-delete-word)))

(provide 'init-vertico)

;;; init-vertico.el ends here.
