;;; init-emacs.el --- Most Emacs options and hooks -*- lexical-binding: t; -*-

;;; Commentary:

;; Many customizations and hooks here. I have tried to group these by
;; general area of responsibility.

;; A possible confusion: My configuration for `mlscroll' depends upon
;; `which-function-mode'. I tried hanging both on `emacs-startup-hook'
;; but the ordering didn't work. I now enable both modes in the proper
;; order in `init-mlscroll',

;; Aliases are defined in `init-aliases' which should be one of the last
;; things required from `init.el'.

;;; Code:

;;;; Emacs:

(defalias 'yes-or-no-p 'y-or-n-p
  "I prefer shorter and consistent prompting.")

(use-package emacs

  :hook

  ;; Most hooks are linked here, even though it would be just as valid
  ;; to put some under their owning package. One example would be
  ;; `which-function-mode' from the `which-function' package. It seems
  ;; to me that the major modes `text-mode' and `prog-mode' belong
  ;; here under `emacs'.

  ;; General text.

  (text-mode . visual-line-mode)
  (text-mode . turn-on-auto-fill)

  ;; General program code.

  (prog-mode . display-line-numbers-mode)


  ;; Minibuffer display and behavior.

  (emacs-startup . minibuffer-depth-indicate-mode)
  (emacs-startup . minibuffer-electric-default-mode)

  :config

  (global-prettify-symbols-mode +1)

  :custom

  ;; Use this rather than the Easy Customization UI or the `setopt'
  ;; form.

  ;; Some personalization.

  (user-full-name "Troy Brumley")
  (user-mail-address "BlameTroi@gmail.com")
  (auth-sources '("~/.authinfo.gpg"))
  (auth-source-cache-expiry nil)
  (initial-scratch-message ";;; So let it be written; So let it be Done.")

  ;; Backups, trashcan.

  (make-backup-files nil)
  (backup-inhibited nil) ; ?
  (create-lockfiles nil)
  (auto-save-default nil)
  (delete-by-moving-to-trash t)

  ;; Editing-related options

  (electric-pair-mode t) ; normally nil
  ;; (repeat-mode t)
  (delete-selection-mode t)
  ;; (editorconfig-mode t) ; nope, I don't
  (indent-tabs-mode nil)
  (imenu-auto-rescan t)
  (view-read-only t)
  (column-number-mode t)

  ;; Text.

  ;; There are packages `visual-fill' and `visual-fill-column' meant
  ;; to allow text to visually wrap before the right edge of a screen,
  ;; as when writing text on a single window frame on a wide screen. I
  ;; couldn't get the to work the way I wanted and have dropped them.
  ;; `v-f-c' has been moved to _melpa-stable_ and may be worth trying
  ;; again. text displayed when you use a single window on a wide
  ;; screen. If you are wrapping, text will wrap at the fill column
  ;; and not the screen edge.

  ;; The normal `visual-line-mode' is fine for most plain text
  ;; formats, but you probably want to set `truncate-lines' to `t'
  ;; for code formats.

  (fill-column 70)

  ;; Forcing left to right text instead of allowing right to left is
  ;; reported to be a significant speedup for files with long lines.
  ;; Obviously you should not use this if you work with bidirectional
  ;; text (Arabic, Hebrew). See also `so-long'.

  (bidi-paragraph-direction 'left-to-right)

  ;; Prose text and filling.

  (sentence-end-double-space nil)
  (sentence-end-without-period nil)
  (adaptive-fill-mode t)

  ;; Line numbering in programming modes is the way. I prefer a fixed
  ;; minimum width.

  (disply-line-numbers-width 3)

  ;; Mode line and related settings.

  ;; Column numbers and row/column tracking in mode line. I run with
  ;; column information visible full time. I count from one the way
  ;; God intended. Use `%C' for 1, `%c' for 2.

  (mode-line-position-column-line-format '(" (%l,%C)"))

  ;; Squeeze blank runs if window width is less than frame and it
  ;; the mode line would be truncated.

  (mode-line-compact 'long)

  ;; Built-in completion dials and switches. Also see
  ;; `completion-category-overrides'. Packages `vertico', `corfu',
  ;; `cape', and others are configured later in this init.

  (tab-always-indent 'complete)
  (completion-styles '(basic initials substring))
  (completion-ignore-case t)
  (read-buffer-completion-ignore-case t)
  (case-fold-search t)   ; For general regexp
  (read-file-name-completion-ignore-case t)
  (completion-cycle-threshold 1)
  (completions-detailed t)
  (completion-auto-help 'always)
  (completions-max-height 7) ; SWAG
  (completions-format 'one-column)
  (completions-group t)
  (completion-auto-select 'second-tab)
  (apropos-sort-by-scores t)

  ;; Minibuffers.

  (enable-recursive-minibuffers t)
  (minibuffer-default-prompt-format " [%s]")

  ;; Make M-x exclude commands marked specific to a mode that is not
  ;; enabled in the current buffer.

  (read-extended-command-predicate
   #'command-completion-default-include-p)

  ;; Smooth scrolling.

  (scroll-margin 0)
  (scroll-conservatively 100000)
  (scroll-preserve-screen-position 1)

  ;; Mouse. NOTE: I don't use the mouse often. Most of these are
  ;; from the newcomers user theme meant to make Emacs behave more
  ;; like modern programs.

  (pixel-scroll-mode t)
  (pixel-scroll-precision-mode t) ; see bug#69972
  (context-menu-mode t)
  (save-interprogram-paste-before-kill t)
  (mouse-yank-at-point t)
  (mouse-drag-and-drop-region t)
  (mouse-drag-and-drop-region-cross-program t)
  (mouse-drag-mode-line-buffer t)
  (global-xref-mouse-mode t)

  ;; As yet uncategorized.

  (blink-matching-delay 0.25)
  (blink-cursor-mode t)
  (delete-selection-mode +1)
  (indent-tabs-mode +1)
  (tab-always-indent 'complete)
  (comment-empty-lines t)
  (require-final-newline t)
  (switch-to-buffer-obey-display-actions t)
  (help-window-select t)
  (help-window-keep-selected t)
  (confirm-kill-emacs 'y-or-n-p)
  (show-trailing-whitespace nil)
  (indicate-buffer-boundaries 'left)

  )

(provide 'init-emacs)

;;; init-emacs.el ends here.
