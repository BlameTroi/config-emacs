;;; init-corfu.el --- Configure various placeholders -*- lexical-binding: t; -*-

;;; Commentary:

;; `corfu' is COmpletion in Region FUnction. This set of `use-package'
;; definitions will provide popups at/near the point instead of
;; forcing your focus to the minibuffer.

;; `corfu-popupinfo' is part of the `corfu' package. There is also
;; support for text terminals in a separate package  `corfu-terminal'.
;; As I don't use text mode, it is not included here.

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
