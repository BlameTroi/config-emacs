;;; early-init.el --- Troy Brumley's early-init.el -*- no-byte-compile: t; lexical-binding: t; -*-

;;; Commentary:

;; Copyright (C) 2024-2025 Troy Brumley (aka Troi)
;; Author: Troy Brumley <blametroi@gmail.com>
;; All rights reserved.

;; This file is NOT part of GNU Emacs. The author considers
;; it to be in the public domain.

;; That which must be done first. Mostly dark mode graphics,
;; tweak the OS specific display options to my liking, and
;; try to speed up initialization via garbage collection
;; tweaking.

;;; Code:


;;; Speed up initialization:

;; Reduce garbage collection frequency during startup by
;; increasing trigger thresholds. These triggers are
;; restored after initialization is finished.

;; TODO: GCMH at some point.

(defvar troi/gc-cons-threshold gc-cons-threshold)
(defvar troi/gc-cons-percentage gc-cons-percentage)
(setopt gc-cons-threshold most-positive-fixnum)
(setopt gc-cons-percentage 1.0)

;;; Native compilation.

;; Configure native compilation and move the `eln-cache' under
;; `var/eln-cache/' if native compilation is available.

(if (and (fboundp 'native-comp-available-p)
         (native-comp-available-p))
    (progn
      (setopt native-comp-async-report-warnings-errors 'silent)
      (setq native-comp-jit-compilation t)
      (if (fboundp 'startup-redirect-eln-cache)
          (startup-redirect-eln-cache
           (convert-standard-filename
            (expand-file-name  "var/eln-cache/" user-emacs-directory))))))

;; Remove `*.eln' files that are not compatible with the current
;; Emacs build.

(if (fboundp 'native-compile-prune-cache)
    (progn
      (native-compile-prune-cache)))

;; Silence warnings that aren't relevant to me.

;; NOTE: While the documentation says that `byte-compile-warnings' may
;; be customized, a `setopt' with a value of '(not obsolete) throws a
;; warning that the value is not valid. According to the documentation
;; this is a valid value. This can be silenced by using `setq' which
;; is what I see in other configurations.

(setq byte-compile-warnings '(not obsolete))
(setopt warning-suppress-log-types '((comp) (bytecomp)))
(setopt native-comp-async-report-warnings-errors 'silent)


;; Force a garbage collection if I leave Emacs temporarily.
;; I don't know how much it helps on modern hardware.

(defun troi/gc-after-focus-change ()
  "Run GC when frame loses focus."
  (run-with-idle-timer
   5 nil
   (lambda () (unless (frame-focus-state) (garbage-collect)))))

;; Disable handlers for `special' file name during startup.
;; They are stored once initialization is finished.

(defvar troi/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Version Control can be queried during initialization. To
;; speed this process I remove all backend VCS support except
;; Git.

;; Since I only use Git the other backend handlers are not
;; restored.

;; I've seen some configurations that remove all backends
;; here but that won't work if you load packages from VCS
;; via `use-package'.

(defvar troi/vc-handled-backends vc-handled-backends)
(setopt vc-handled-backends '(Git))

;;; Dealing with the touchpad.

;; Purcell's `disable-mouse' does the trick quite nicely. The mouse
;; pointer can still be visible, and when moved it triggers some
;; hover effects (clickable links show they are focused) but clicks
;; don't register in the Emacs frame. Pefection!

;; This may no longer be needed. I use a thumb trackball
;; with my Mac most of the time.
;;
;; TODO: See also package inhibit-mouse on melpa-stable.
;; (defun troi/bad-mouse-stop-that ()
;;   "Disable the mouse/touch-pad.
;; This function aggressively swats mouse/touchpad in an attempt
;; to prevent the Mac track-pad from causing motion when I
;; inevitably brush it. I am setting it twice, both in
;; `emacs-startup-hook' and `after-init-hook' because I know of
;; at least one package that needs `mouse-wheel-mode' turned off
;; during init and because something else during init overwrites
;; my `wheel-down' overrides."
;;
;;   (global-set-key [wheel-up] 'ignore)
;;   (global-set-key [double-wheel-up] 'ignore)
;;   (global-set-key [triple-wheel-up] 'ignore)
;;   (global-set-key [wheel-down] 'ignore)
;;   (global-set-key [double-wheel-down] 'ignore)
;;   (global-set-key [triple-wheel-down] 'ignore)
;;   (global-set-key [wheel-left] 'ignore)
;;   (global-set-key [double-wheel-left] 'ignore)
;;   (global-set-key [triple-wheel-left] 'ignore)
;;   (global-set-key [wheel-right] 'ignore)
;;   (global-set-key [double-wheel-right] 'ignore)
;;   (global-set-key [triple-wheel-right] 'ignore)
;;   (mouse-wheel-mode -1)
;;   (message "track-pad stuff set to ignore"))

;; Let's try Purcell's disable-mouse package.
;; (add-to-list
;;  'emacs-startup-hook #'troi/bad-mouse-stop-that)
;; (add-to-list
;;  'after-init-hook #'troi/bad-mouse-stop-that)


;;; Park the mouse pointer in an inoffensive location.

;; I rarely use the mouse, and then only switch windows,
;; so this won't disrupt my flow.

;; (mouse-avoidance-mode 'banish)
;; (setopt mouse-avoidance-banish-position
;;         '((frame-or-window . frame) (side . right) (side-pos . 1)
;;           (top-or-bottom . bottom) (top-or-bottom-pos . 15)))


;;; Prepare for display.

;; These set the frame on my Mac to 'real' full-screen.

;; The background and foreground color settings were copied from
;; another config to make the color switch from the Emacs default to
;; the themed colors when Emacs initializes. This caused new frames to
;; use these colors and not the themed colors. Cloning the first frame
;; used correct colors.

;; I don't restart Emacs often enough that I find the visuals annoying
;; so I clipped the colors here. If I decide I want this I will have
;; to see if rebuilding the list without the foreground and background
;; settings works. I assume from the after init hook.

(setopt frame-inhibit-implied-resize t)
(setopt frame-resize-pixelwise t)
(setopt window-resize-pixelwise t)

(setopt initial-frame-alist '((fullscreen . maximized)
                              ;; (background-color . "#000000")
                              ;; (foreground-color . "#ffffff")
                              (ns-appearance . dark)
                              (ns-transparent-titlebar . t)))
(setopt default-frame-alist '((fullscreen . maximized)
                              ;; (background-color . "#000000")
                              ;; (foreground-color . "#ffffff")
                              (ns-appearance . dark)
                              (ns-transparent-titlebar . t)))
(setopt use-dialog-box nil)
(setopt use-file-dialog nil)

(when (boundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (display-graphic-p)
  (context-menu-mode))

(scroll-bar-mode -1)

;; Process performance tuning. `read-process-output-max' has
;; an effect on communication with LSPs and other processes.
;; My main source for this is Purcell.

(setq read-process-output-max (* 64 1024))
(setq process-adaptive-read-buffering nil)

;; Hooks to restore original values for garbage collection
;; and special file name handlers.

;; If `after-focus-change-function' is bound, add my
;; function to force a garbage collection when Emacs
;; loses focus.

(add-hook
 'emacs-startup-hook
 (lambda ()
   ;; These were hard coded as 8 Mb and 20%.
   (setopt gc-cons-threshold troi/gc-cons-threshold)
   (setopt gc-cons-percentage troi/gc-cons-percentage)
   (setq   file-name-handler-alist troi/file-name-handler-alist)
   (message "gc-cons-threshold & file-name-handler-alist restored")
   (when (boundp 'after-focus-change-function)
     (add-function
      :after after-focus-change-function
      #'troi/gc-after-focus-change))))

(provide 'early-init)
;;; early-init.el ends here.
