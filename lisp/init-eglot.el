;;; init-eglot.el --- LSP via eglot -*- lexical-binding: t; -*-

;;; Commentary:

;; I have a lot of old notes and comments that may not apply anymore.

;; Only global eglot settings should be added here. Using a specific or
;; non-default language server should be configured from the specific
;; language's initialization.

;; As of my last use, eglot automatically uses fortls with sensible
;; default options.

;; Finally, rather than hooking `eglot-ensure' I will follow the manual's
;; recommendation of manually invoking `eglot' as needed.

;;; Code:

;; Eglot:

(use-package eglot
  :ensure t
  :diminish
  :bind (:map eglot-mode-map
              ("C-c c a" . eglot-code-actions)
              ("C-c c o" . eglot-code-actions-organize-imports)
              ("C-c c r" . eglot-rename))
  :custom
  ;; log size 0 disables logging
  (eglot-events-buffer-config '(:size 4096 :format short))
  (eglot-autoshutdown t)
  (eglot-extend-to-xref t))



  ;; (eglot-ignored-server-capabilities
  ;;  '(:documentFormattingProvider
  ;;    :documentRangeFormattingProvider
  ;;    :documentOnTypeFormattingProvider)))


;; TODO: rehome these to language specific sections.
;; We can start up language servers as sub-processes, be sure we can
;; find the executables.
;; (add-hook 'c-ts-mode-hook 'eglot-ensure)
;; (add-hook 'c++-ts-mode-hook 'eglot-ensure)
;; (add-hook 'odin-mode-hook 'eglot-ensure)

;; if debugging 'eglot' issues, comment out the fset and
;; events-buffer-config lines.
;; (fset #'jsonrpc--log-event #'ignore)  ; performance boost-don't log every event
;; (setopt jsonrpc-event-hook nil)

(provide 'init-eglot)

;;; init-eglot.el ends here.
