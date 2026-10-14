;;; init-c.el --- The C programming language -*- lexical-binding: t; -*-

;;; Commentary:

;; While I am able to stay away from C++, C is inevitable.

;; This is a few years old from when c-mode and its relatives
;; were being updated along with the introduction of c-ts-mode and its
;; relatives. There were some complaints and comments about
;; incompatabilities and breaking usage/intent.

;; I don't know if this will work right, but it did in 2023/24.

;;; Code:

(with-eval-after-load 'c-ts-mode
  (setopt c-ts-mode-indent-offset 8)
  (setopt c-ts-mode-indent-style 'k&r)
  (keymap-unset c-ts-base-mode-map "C-c C-c")) ; redundant 'comment-region'


;; Configure the 'clangd' language server to my preferences. 'clangd'
;; uses 'CMakeLists.txt' and 'compile_commands.json' to determine what
;; to analyze. There are default settings in my local config as well.

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((c-mode c-ts-mode) ;;  c++-mode c-ts-mode c++-ts-mode)
                 . ("clangd"
                    "-j=4"
                    "--log=info"
                    "--background-index"
                    "--clang-tidy"
                    "--completion-style=detailed"
                    "--pch-storage=memory"
                    "--header-insertion=never"
                    "--header-insertion-decorators=0")))
  (add-hook 'c-ts-mode-hook 'eglot-unsure))

(provide 'init-c)

;;; init-c.el ends here.
