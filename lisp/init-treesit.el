;;; init-history.el --- The miracle of tree sitter -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; There isn't much configuration to do for Treesitter. The
;; customization options are minimal and it's just "always there."

;; Some of these might require M-x treesit-install-language-grammar.

;; Review treesit-font-lock-level, it may need to very by language
;; somehow.

(use-package treesit
  :defer
  :custom
  (treesit-font-lock-level 4) ; last I looked 1-3 are useless
  (major-mode-remap-alist
          '((bash-mode . bash-ts-mode)
            (json-mode . json-ts-mode)
            (c-mode . c-ts-mode)
            (go-mode . go-ts-mode)
            (c++-mode . c++-ts-mode)
            (c-or-c++-mode . c-or-c++-ts-mode)
            (ruby-mode . ruby-ts-mode))))

;; This may no longer be needed as treesit seems to do everything
;; required.

;; (use-package treesit-auto
;;     :ensure t
;;     :hook
;;     (emacs-startup . global-treesit-auto-mode)
;;     :custom
;;     (treesit-auto-install 'prompt)
;;     (treesit-auto-add-to-auto-mode-alist 'all)
;;     :config
;;    (global-treesit-auto-mode))

(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (c "http://github.com/tree-sitter/tree-sitter-c")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        (cmake "https://github.com/uyha/tree-sitter-cmake")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (make "https://github.com/alemuller/tree-sitter-make")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(provide 'init-treesit)

;;; init-treesit.el ends here.
