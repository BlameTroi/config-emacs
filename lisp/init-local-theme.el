;;; init-local-theme.el --- Custom themes that are not in ELPA -*- lexical-binding: t; -*-

;;; Commentary:

;; Set up custom theme and adjust any faces. While I would prefer
;; to adjust faces for other packages in their configuration I
;; think it will be easier to group them in one place.

;;; Code:


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


;; If acme theme isn't in site-lisp, uncomment this to get fonts
;; to a readable size and comment out the lines following from
;; the require through to the custom-theme-set-faces.


;; begin block to comment
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
;; end block to comment

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


(provide 'init-local-theme)

;;; init-local-theme.el ends here.
