;;; init-elpa-theme.el --- Use a theme from ELPA -*- lexical-binding: t; -*-

;;; Commentary:

;; I don't han ELPA hosted theme that I want to use, so I will just use
;; the built in manoj-dark. This is also the default if a local theme
;; can not be found.

;;; Code:

;; The manoj-dark theme could use a few tweaks but it's
;; a good built in default.
(setopt custom-enabled-themes '(manoj-dark))
(custom-theme-set-faces
 'user
 '(default
   ((t
     (:height 150 :width expanded)))))

(provide 'init-elpa-theme)

;;; init-elpa-theme.el ends here.
