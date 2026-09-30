;;; init-whitespace.el --- Show what is hidden -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package whitespace
  :custom
  (whitespace-style '(face tabs tab-mark trailing))
  (whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
  :custom-face
  (whitespace-tab ((t (:foreground "#636363"))))
  :config
  (global-whitespace-mode))

;;   ;; This will also show trailing characters as they are useful to spot.
;; (setq whitespace-style '(face tabs tab-mark trailing))
;; ;; TODO: convert to `:custom-face' or `set-face-attribute'.
;; (custom-set-faces
;;  '(whitespace-tab ((t (:foreground "#636363")))))
;; (setq whitespace-display-mappings
;;   '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
;; (global-whitespace-mode) ; Enable whitespace mode everywhere

;; Trailing spaces are evil. One reason I don't like Markdown
;; is that trailing spaces are significant. I only turn this
;; on automatically for programming modes. Prose and data
;; are under manual control.

(use-package ws-butler
  :ensure t
  :diminish
  :hook (prog-mode))

(provide 'init-whitespace)

;;; init-whitespace.el ends here.
