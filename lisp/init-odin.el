;;; init-odin.el --- Configure various placeholders -*- lexical-binding: t; -*-

;;; Commentary:

;; Odin support isn't available via ELPA yet. I have cloned the
;; repositories under my `site-lisp/' directory. All of this are in
;; varying states of development.

;; Trying out odin-ts-mode.

;;; Code:

(defun my/odin-configuration ()
  "Tweak and then start eglot."
  (eglot-ensure)
  (setq indent-tabs-mode t)
  ;; For reasons I have not determined, the odin-ts-mode-indent-offset
  ;; value is not being used. tab-width is used instead.
  (setq tab-width odin-ts-mode-indent-offset))

(require 'odin-ts-mode)

(add-to-list 'auto-mode-alist '("\\.odin\\'" . odin-ts-mode))

(add-hook 'odin-ts-mode-hook 'my/odin-configuration)

(with-eval-after-load 'eglot
  (add-to-list
   'eglot-server-programs
   '(odin-ts-mode . ("ols"))))

(provide 'init-odin)

;;; init-odin.el ends here.
