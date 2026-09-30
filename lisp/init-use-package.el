;;; init-use-package.el --- Configure package and use-package -*- lexical-binding: t; -*-

;;; Commentary:

;; Set up some `use-package' defaults and add the melpa archives to
;; gnu and nongnu. `diminish' is loaded here as well.

;;; Code:

;; Change `use-package' defaults and customizations here.
(defconst *use-package-ensure* nil
  "The default value for the :ensure argument.
I believe this should always be nil. Explicitly use `:ensure t'
for any package that originates from or is an updatable built in
package to load it from ELPA archives or a Git repository.")
(defconst *use-package-verbose* t
  "The default value for `use-package-verbose'.")
(defconst *use-package-upgrade-built-in* t
  "The default value for `package-install-upgrade-built-in'.")
(defconst *use-package-prefer-newer* t
  "The default value for `load-prefer-newer'.")

(eval-when-compile
  (require 'use-package))

;; Built in packages such as `org' and `eglot' should be updated from
;; archives when new versions are posted to the production archives.

(setopt load-prefer-newer *use-package-prefer-newer*)
(setopt package-install-upgrade-built-in *use-package-upgrade-built-in*)

;; Always ensure should always be nil, but if for some reason you don't
;; agree, change the constant in `init.el'.

(setopt use-package-always-ensure *use-package-ensure*)
(setopt use-package-verbose *use-package-verbose*)

(when (native-comp-available-p)
  (setopt package-native-compile t))

;; Add both `melpa' and `melpa-stable' to the default `gnu' and
;; `nongnu' package archives. The prioriities are set to get the first
;; package found in the order `melpa-stable' `gnu' `nongnu' `melpa'.

;; To override this order, use a specific version, or load from a
;; Git repository, use parameters such as `:vc' and `:pin'.

(with-eval-after-load 'package
  (defvar package-archives)
  (add-to-list
   'package-archives
   '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (add-to-list
   'package-archives
   '("melpa" . "https://melpa.org/packages/") t)
  (setopt package-archive-priorities
  '(("melpa-stable" . 10)
    ("gnu" . 9)
    ("nongnu" . 8)
    ("melpa" . 7))))

;;; You may now use the `use-package' macro.

;; The `:diminish' argument quietly does nothing if a diminisher is
;; not available.

(use-package diminish :ensure t)

(provide 'init-use-package)

;;; init-use-package.el ends here.
