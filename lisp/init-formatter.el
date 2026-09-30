;;; init-formatter.el --- Code formatting, usually on save. -*- lexical-binding: t; -*-

;;; Commentary:

;; Reformatting can be provided by an LSP that offers it, but I prefer
;; to format on save using Purcell's reformatter package and astyle.

;; TODO: Move specific language formatting options to the appropriate
;; language specific initialization. Any hooks should also be set
;; there.

;;; Code:

(use-package reformatter
  :ensure t
  :diminish
  :config
  (when (executable-find "astyle")
    (add-hook 'c-ts-mode-hook 'astyle-on-save-mode)
    (add-hook 'c++-ts-mode-hook  'astyle-on-save-mode)))

;; I use 'astyle' to format C. The configuration goes in .astylerc
;; in my home directory. My formatting is based on the 'linux' and
;; 'k&r' styles.

(use-package astyle
  :ensure t
  :after reformatter
  :when (executable-find "astyle")
  :diminish (astyle-on-save-mode . "As"))

;; merely indenting code is not sufficient, and the current state of
;; treesitter user configuration for the c-ts modes is sadly lacking.
;; as i got used to always formatting on save when working with go,
;; let's try to use reformatter to drive astyle for c, and add other
;; languages if i ever feel a need.
;;
;; the astyle reformat package uses customization, but i was able to
;; pull out the settings and put them properly in use-package.

;; i tried rebox2 for comment blocks but it's a bit touchy and seems
;; to have a problem if you mix comment openers in c (/* vs //). i've
;; left the config in but commented out for now.

;; i've set up a .astylerc file and am running manually for a bit,
;; but leaving this in place but disabled the on save.

;; (c-ts-mode . astyle-on-save-mode)
;; (c++-ts-mode . astyle-on-save-mode)
;; :custom
;; (astyle-style "knf")              ;; or linux
;; (astyle-indent "tab")             ;; might as well go whole hog
;; (astyle-custom-args '(
;;                              "-xn"          ;; --attach-namespaces
;;                              "-xc"          ;; --attach-classes
;;                              "-xk"          ;; --attach-extern-c
;;                              "-xV"          ;; --attach-closing-while     } while ();
;;                              "-H"           ;; --pad-header               if ()
;;                              "-U"           ;; --unpad-paren
;;                              "-xB"          ;; --break-return-type
;;                              "-xD"          ;; --break-return-type-decl
;;                              )))
;; (astyle-style "attach")              ;; --style=attach
;; (astyle-indent 3)                    ;; -s3
;; (astyle-custom-args '(
;;                       "-xn"          ;; --attach-namespaces
;;                       "-xc"          ;; --attach-classes
;;                       "-xk"          ;; --attach-extern-c
;;                       "-xV"          ;; --attach-closing-while     } while ();
;;                       "-H"           ;; --pad-header               if ()
;;                       "-U"           ;; --unpad-paren
;;                       "-j"           ;; --add-braces
;;                       "-xB"          ;; --break-return-type
;;                       "-xD"          ;; --break-return-type-decl
;;                       "-xg"          ;; --pad-comma
;;                       ;;"-p"           ;; --pad-oper  (implies -xg --pad-comma)
;;                       ))

(provide 'init-formatter)

;;; init-formatter.el ends here.
