;;; init.el --- Troy Brumley's init.el -*- lexical-binding: t -*-


;;; Commentary:

;; This is a configuration. While it includes executable code it is
;; not a "program" in the traditional sense. While it is FOR Emacs it
;; is NOT a part of Emacs.


;; In case this should be copyrighted:
;; (c) 2026 Troy Brumley <blametroi@gmail.com>.

;; In case this should be licensed:
;; I release this to the public domain under the terms of the UNLICENSE.


;; With that out of the way, let's get started.


;;;; OVERVIEW:

;; I am running GUI Emacs 31 and its capabilities are assumed
;; throughout. I don't do release checks and fallbacks beyond issuing
;; warnings during initialization.

;; My goals for this configuration:
;; - Native Emacs on MacOS.
;; - Discoverability aids.
;; - Support for my personal taste in languages (C, Odin, Pascal,
;;   Fortran, Scheme, Emacs Lisp, ...).
;; - Eglot (LSP) and Treesitter when available.
;; - Simple word processing via org and markdown.


;; I prefer the XDG directory standards and this configuration can be
;; cloned under ~/.config via "git clone <repository url> emacs". The
;; configuration is broken up into multiple `init-*.el' files under the
;; `lisp' subdirectory. The `site-lisp' directory is meant for things
;; that are in development or not in an ELPA archive.


;; I do not use the "Easy Customization" system for configuration. I do
;; use it for exploration. The customization save file has been renamed
;; to `ignored-custom.el' and is excluded from the repository via
;; `.gitignore'.


;; Setting customizable options should be done via `setopt' or as an
;; entry under the `use-package' `:custom' header.

;; Most options are "owned" by a feature as part of a faux package.
;; `use-package' can be used to collect the options and keep other
;; initializations (faces, hooks) close to each other.


;; `use-package' can be used on anything that returns t from `featurep'.
;; Emacs itself is a "feature" as are `dired', `recentf',`eshell', and
;; etc.


;;;; INSPIRATIONS:

;; There are several good starter/tutorial configurations on Reddit,
;; GitHub, and elsewhere. These are the main sources:

;; 1) Protesilaos "Prot" Stavrou's highly instructive literal
;;    configuration found on his website:

;;    https://protesilaos.com/emacs/dotemacs

;; 2) Ashton Wiersdorf's Emacs-Bedrock  at:

;;    https://codeberg.org/ashton314/emacs-bedrock

;; 3) Steve Purcell's configuration that he posts on GitHub.

;; 4) An old copoy of Tess O'Connor's configuration that I
;;    found somewhere many years back and saved for future
;;    reference.

;; 5) The first really good Emacs introduction/tutorial I
;;    found was by Tu Do (tuhdo at GitHub). See it here:

;;     https://tuhdo.github.io/emacs-tutor.html

;; 6) _Mastering Emacs_ by Mickey Peterson.

;; While I will note either the source or author of any code that I feel
;; should be explicitly credited, you can safely assume that most of the
;; "code" (mainly functions) originated elsewhere.

;; Prefixing functions meant to be used globally with a tag is
;; standard practice. I will change those I find to "my/". This is to
;; identify them as extensions and not to lay claim to the code
;; itself.

;; I claim only the comments, code layout, and any errors I might
;; introduce.


;; If you are just starting out with Emacs I recommend that you start
;; with Emacs-Bedrock and build out from there. It provides a useful
;; Emacs configuration using some of the recent options for
;; completions and language support.


;;;; BUGS AND TO DO:

;; `no-littering' setup is not automatted. Once things are stable
;; switch to use it.

;; See if `visual-file-column' works as I want.

;; Will `flycheck' work with `eglot'? Do I have to do some sort of
;; indirection through `flymake'. Yes, Purcell has some sort helper
;; package, but for now I'll leave things with `flymake'.

;; Get `cmark-gfm' configuration for `markdown-mode' finalized.

;; Settle on a Markdown previewer.

;; Review `minad/tempel' as a snippet and template provider.

;; Check out the year-1984-theme. It is acme like but is actually
;; based on vintage Mac colors.

;; See https://www.jamescherti.com/emacs-the-definitive-guide-to-code-folding/
;; for a good looking code folding configuration. Need to get my
;; programming language stuff set up first.

;; Organize key bindings.

;; Bring C/Eglot/Astyle configuration up to date.

;; ace-window does not recognize the treemacs pane.

;; CHANGE LOG:

;; 2026/09/__  Recreated from old configurations with borrowings
;;    to       from Stavrou, Purcell, Wiersdorf, O'Connor,
;; 2026/10/01  Peterson, Cherti, and many others.

;;; Code:


;;;; Bootstrap and compatibility warnings.

;;;;;; `use-package' is NOT available. ---------------------------------

(setopt debug-on-error t)
(require 'cl-lib)


;;;;; Add subdirectory `lisp' to the load path.

;; Add `lisp' to `load-path' and define my non-standard macros and
;; functions.

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-macros-and-functions)


;;;;; Version compatibility checks.

(when (< emacs-major-version 31)
  (error "Emacs version 31 or newer required!"))

(when (not (display-graphic-p))
  (message "GUI Emacs is assumed. Some things may break in a TUI.")
  (sleep-for 5))

(when-not-running-on-macos
  (message "MacOS is assumed. Some things likely will break.")
  (sleep-for 5))


;;;;; Add `site-lisp', its subdirectories, and `lisp's subdirectories to load-path.

(push (expand-file-name "lisp" user-emacs-directory) load-path)
(troi/add-subdirs-to-load-path (expand-file-name "lisp/" user-emacs-directory))

(push (expand-file-name "site-lisp" user-emacs-directory) load-path)
(troi/add-subdirs-to-load-path (expand-file-name "site-lisp/" user-emacs-directory))


;;;;; Configure `package' and `use-package':

;; The `use-package' macro may not be used until this section is
;; finished.

(require 'init-use-package)

;;;;;; `use-package' available. ----------------------------------------


;;;;; Fix up path and environment variables: (Mac only)

;; I only use MacOS and other than a few warnings I don't have any
;; guard clauses or fallback behavior for non Mac use.

(require 'init-macos-shell-environment)


;;;; Configure Emacs and its various built in features:

;;;;; The basics.

(require 'init-emacs)      ;; a whole bunch of general settings
(require 'init-memory)     ;; of history, recent files, etc
(require 'init-movement)   ;; movement/jump helpers avy & ace
(require 'init-mouse)      ;; disable it
(require 'init-confusion)  ;; enable disabled "confusing" commands


;;;;; The not so  basic.

(require 'init-dired)      ;; configure gls, dired behavior
(require 'init-ibuffer)    ;; group buffers by type
(require 'init-searching)  ;; isearch, grep, rg


;; Textual healing.

(require 'init-editorconfig)  ;; I am so not a fan.


;;;;; Discoverability aids.

(require 'init-which-free-keys)  ;; key does what exactly
(require 'init-display-helpers)  ;; highlights, line lengths
(require 'init-whitespace)       ;; show it, clean it up
(require 'init-info-readers)     ;;
(require 'init-eldoc)            ;; and eldoc-box
(require 'init-tooltip)          ;; popups


;;;;; Diagnostics, Linting.

(require 'init-spelling)  ;; ispell using aspell backed by mac
(require 'init-flymake)   ;; not sure if I should add flycheck


;;;; Applications and utilities.

(require 'init-org)            ;; because org
(require 'init-markdown)       ;; can't escape it
(require 'init-mpages)         ;; a diary of sorts
;; deft? spreadsheet, etc.
(require 'init-treemacs)       ;; treeview for projects
(require 'init-dired-sidebar)  ;; directory treeview/navigation
(require 'init-diff)           ;; basic diff and ediff
(require 'init-dircmp)         ;; compare directories





;;;; Programming and version control:

;;;;; Version control, git, and project management.

(require 'init-vc)         ;; including magit
(require 'init-project)    ;; not projectile

;;;;; Modern language mode infrastructure.

(require 'init-eglot)      ;; lsp
(require 'init-treesit)    ;; better faster language modes

;;;;; Shell, compile, format:

(require 'init-shell)      ;; eshell & eat
(require 'init-compile)    ;; as yet unwritten
(require 'init-formatter)  ;; format on save, not lsp formatters

;;;;; Language specific configuration.

(require 'init-cmake)   ;; and friends like ninja.
(require 'init-cobol)   ;; gnu
(require 'init-fortran) ;; 77, IV, F90, F95, Modern
(require 'init-git)     ;; as distinct from the magit application
(require 'init-lisps)   ;; elisp and code common to schemes
(require 'init-odin)    ;;
;; pascal, python, ruby, assembly, etc.


;;;; Minibuffer and basic completion.

(require 'init-vertico)     ;; vertical lists not horizontal
(require 'init-corfu)       ;; completion in region
(require 'init-cape)        ;; completion at point instead of minibuffer
(require 'init-marginalia)  ;; annotate items in minibuffer

;;;; Icons, themes, faces, and other visuals. *bling*

;;;;; Item icons via `nerd' and `kind'.

(require 'init-nerd)      ;; and kind icons


;;;;; Theme:

;; Many themes are not in ELPA. I have cloned the repositories for
;; `nofrils-acme-theme', `acme-emacs-theme', and `plan9' to my
;; `site-lisp' directory. There is an `acme-theme' in the
;; _melpa-stable_ archive but it is not configured correctly. It is
;; missing the `acme-theme-autoloads.el'.

;; Examining diffs of `acme-emacs-theme' and `acme-theme' shows that
;; they are versions of each other. It is not immediately obvious
;; which one is more recent but the overlap is significant and both
;; work for me. I've decided to move forward with the
;; `acme-emacs-theme' and may make changes and try to package it for
;; ELPA at some point.

(setopt custom-safe-themes t)
(require 'acme-theme)
(mapc #'disable-theme custom-enabled-themes)
(load-theme 'acme t)

(custom-theme-set-faces
 'user
 '(default
   ((t
     (:font "CaskaydiaMono Nerd Font"
            :height 155
            :width expanded))))
 '(fixed-pitch
   ((t
     (:font "CaskaydiaMono Nerd Font"
            :height 155))))
 '(compilation-error
   ((t
     (:background "gray80"
                  :foreground "Red"))))
 '(corfu-default
   ((t
     (:foreground "#0f0f01"))))
 '(flymake-error
   ((t
     (:underline
      (:color "Red"
              :style wave)))))
 '(font-lock-comment-face
   ((t
     (:foreground "#007700" ; or #005500?
                  :slant italic)))))

;; (use-package acme-theme
;;   :ensure t
;;   :config
;;   (load-theme 'acme t)
;;   :custom-face
;;   (default
;;    ((t
;;      (:font "CaskaydiaMono Nerd Font"
;;       :height 155
;;       :width 'expanded))))
;;   (fixed-pitch
;;    ((t
;;      (:font "CaskaydiaMono Nerd Font"
;;       :height 155))))
;;   (compilation-error
;;    ((t
;;      (:background "gray80"
;;      :foreground "Red"))))
;;   (corfu-default
;;    ((t
;;      (:foreground "#0f0f01"))))
;;   (flymake-error
;;    ((t
;;      (:underline
;;       (:color "Red"
;;        :style wave)))))
;;   (font-lock-comment-face
;;    ((t
;;      (:foreground "#707070" ; or #005500?
;;       :slant 'italic)))))

;; (with-eval-after-load hl-line-mode
;; (set-face-attribute 'hl-line nil :inherit 'highlight :extend t :underline nil :background "LightGoldenrod2" :foreground "black")
;; )

;;;;; Additional or customized Faces:

;; (set-face-attribute 'default nil
;; 		    :font "FiraCode Nerd Font Mono"
;; 		    :height 190)
;; (set-face-attribute 'fixed-pitch nil
;; 		    :font "FiraCode Nerd Font Mono"
;; 		    :height 190)
;; (set-face-attribute 'variable-pitch nil
;; 		    :font "Cantarell"
;; 		    :height 230
;; 		    :weight 'medium)

;; (set-face-attribute 'default nil
;; 		    :family "Iosevka")
;; (set-face-attribute 'variable-pitch nil
;; 		    :family "Iosevka Aile")


;; The built in `manoj-dark' theme is new to me. It's
;; very good but it needs some tweaks for my use.

;;(setopt custom-enabled-themes '(manoj-dark))

;; The sepia version is the most readable for me on
;; my Macbook.

;; nofrils-sepia desired, newcomers-presets is actually a bunch
;; of options settings.

;; (setopt custom-safe-themes t)
;; (require 'nofrils-sepia-theme)
;; (load-theme 'nofrils-sepia t)
;; corfu-default face change foreground

;; In prior years I kept returning to the `acme-theme'.
;; It's very easy on the eyes, moreso than high contrast
;; "hard" black background themes.

;; In case I want to use it again:

;; (set-face-attribute 'default nil :font "CaskaydiaMono Nerd Font" :height 155 :width 'expanded)
;; (set-face-attribute 'fixed-pitch nil :font "CaskaydiaMono Nerd Font" :height 155)
;; (set-face-attribute 'compilation-error nil :background "gray80" :foreground "Red")
;; (set-face-attribute 'corfu-default nil :foreground "#0f0f01")
;; (set-face-attribute 'flymake-error nil :underline `(:color "Red" :style wave))
;; (set-face-attribute 'font-lock-comment-face nil :foreground "#707069" :slant 'italic) ; or 005500?
;; (with-eval-after-load hl-line-mode
;; (set-face-attribute 'hl-line nil :inherit 'highlight :extend t :underline nil :background "LightGoldenrod2" :foreground "black")
;; )
;; '(default ((t (:family "CaskaydiaMono Nerd Font" :foundry "nil" :slant normal :weight regular :height 155 :width expanded))))
;; (set-face-attribute 'default nil :family "CaskaydiaMono Nerd Font" :foundry "nil" :slant normal :weight regular :height 155 :width expanded)
;; (set-face-attribute 'default nil :font "FiraCode Nerd Font Mono" :height 190)
;; (set-face-attribute 'variable-pitch nil :font "Cantarell" :height 180 :weight 'medium)


;;;; Keybinding:

;; TODO: These are defined in `init-macros-and-functions'. Standardize
;; binding and move to its own section.

(bind-key "C-x 5t" #'troi/tear-off-window) ;; defined in i-m-a-f
(define-key global-map "\C-xnf" 'troi/narrow-to-focus)

(keymap-set minibuffer-mode-map "TAB" 'minibuffer-complete) ; TAB acts more like how it does in the shell

;; This is meant to have ESC quit out of prompts but it
;; also closes splits.

;; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; On the Mac s-q is the command-Q equivalent. I use both it
;; and M-x 'save-buffers-kill-emacs' to close Emacs. This
;; clears C-x C-c and leaves it available for other uses.

(global-unset-key (kbd "C-x C-c"))

;; The number of times I want a dumb list instead of the
;; smart UI for buffers and directories is zero.

(global-set-key (kbd "C-x C-d") 'dired)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Default search to regexp instead of string. TODO: Provide a toggle
;; or string option. Perhaps prefix mode?

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

;; Zap 'to' not 'through'. This is the way.

(global-set-key "\M-z" 'zap-up-to-char)

;; Review hippie-expand...
;; (global-set-key (kbd "M-/") 'hippie-expand)


;; Use the Do What I Mean versions of region/word/character functions.

(global-set-key (kbd "C-c d") 'duplicate-dwim)
(global-set-key (kbd "M-c") 'capitalize-dwim)
(global-set-key (kbd "M-l") 'downcase-dwim) ; "lower" case
(global-set-key (kbd "M-u") 'upcase-dwim)

;; ("C-M-d" . up-list) ; confusing name for what looks like "down" to me
;; ("<C-M-backspace>" . backward-kill-sexp)
;; Keymap for buffers (Emacs28)
;; :map ctl-x-x-map
;; ("f" . follow-mode)  ; override `font-lock-update'
;; ("r" . rename-uniquely)
;; ("l" . visual-line-mode)
;;:bind (:map eglot-mode-map
;;          ("C-c c a" . eglot-code-actions)
;;        ("C-c c r" . eglot-rename))


;;;; Things that must be done last.

;; Items grouped here are best done last.

(require 'init-aliases)  ;; do this last

(provide 'init)

;;; init.el ends here.
