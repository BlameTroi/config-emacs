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
  :diminish "Egl"
  :bind (:map eglot-mode-map
              ("C-c c a" . eglot-code-actions)
              ("C-c c o" . eglot-code-actions-organize-imports)
              ("C-c c r" . eglot-rename))
  :custom
  ;; log size 0 disables logging
  (eglot-events-buffer-config '(:size 0 :format short))
  (eglot-autoshutdown t)
  (eglot-ignored-server-capabilities
   '(:documentFormattingProvider
     :documentRangeFormattingProvider
     :documentOnTypeFormattingProvider)))


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

;; (setopt eglot-events-buffer-config '(:size 0 :format short))
;; (setopt eglot-autoshutdown t)
;; (setopt eglot-send-changes-idle-time 0.1)
;; (setopt eglot-extend-to-xref t)
;; (setopt eglot-report-progress nil)  ; Prevent minibuffer spam
;; (setopt eglot-ignored-server-capabilities
;;         '(:documentFormattingProvider
;;           :documentRangeFormattingProvider
;;           :documentOnTypeFormattingProvider))
;; eglot is to winning me over as it's easier to manage for the places
;; i use it. it's not as polished as lsp-mode, but it's smaller. i
;; think treesitter actually handles some of what lsp-mode gets used
;; for better anyway.

;; language server program configuration goes here even though you
;; want to think of that in the context of the specific language
;; settings elsewhere throughout this init.

;; flymake lags flycheck in many areas, but its integration with eglot
;; makes it an obvious choice since i don't need the languages and
;; features suppported by flycheck.

;; i'm lean toward minimalism, but i'm not a luddite. probably the
;; thing i do here that might be considered odd is turning off all
;; lsp formatting. not all servers do it, the configuration would
;; likely be a nightmare to manage (see clangd and clang-format),
;; and in some cases they don't over styles i use or find tolerable.


(provide 'init-eglot)

;;; init-eglot.el ends here.
