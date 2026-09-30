;;; init-tooltip.el --- Popup tooltips -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package tooltip
  :hook (after-init . tooltip-mode)
  :custom
  (tooltip-delay 0.5)
  (tooltip-short-delay 0.5)
  (tooltip-frame-parameters
   '((name . "tooltip")
     (internal-border-width . 10)
     (border-width . 0)
     (no-special-glyphs . t))))

(provide 'init-tooltip)

;;; init-tooltip.el ends here.
