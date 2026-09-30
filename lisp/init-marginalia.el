;;; init-marginalia.el --- Annotate completion candidates -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package marginalia
  :ensure t
  :after vertico
  :diminish
  :config
  (marginalia-mode))

(provide 'init-marginalia)

;;; init-marginalia.el ends here.
