;;; init-corfu.el --- COmpletion in Region FUnctions -*- lexical-binding: t; -*-

;;; Commentary:

;; `corfu' is COmpletion in Region FUnction. This set of `use-package'
;; definitions will provide popups at/near point instead of
;; forcing your focus to the minibuffer.

;; `corfu-popupinfo' is part of the `corfu' package.

;; *** The `corfu-terminal' package is not needed in Emacs 31 ***

;;; Code:

;;;; Corfu & corfu-popupinfo:

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :bind
  (:map corfu-map
        ("SPC" . corfu-insert-separator)
        ("C-n" . corfu-next)
        ("C-p" . corfu-previous)))

(use-package corfu-popupinfo
  :after corfu
  :hook (corfu-mode . corfu-popupinfo-mode)
  :custom
  (corfu-popupinfo-delay '(0.25 . 0.1))
  (corfu-popupinfo-hide nil)
  :config
  (corfu-popupinfo-mode))

(provide 'init-corfu)

;;; init-corfu.el ends here.
