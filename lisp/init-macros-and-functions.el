;;; init-macros-and-functions.el --- Various initialization helpers -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; Helpful macros and functions:

(require 'cl-lib)

;; Various conditional macros.

;;; Macos tests modified from Dimitri Fontaine's configuration:

(defmacro when-running-on-macos (&rest body)
  "Evaluate BODY only when running under MacOS."
  `(when (string-match "apple-darwin" system-configuration) ,@body))

(defmacro when-not-running-on-macos (&rest body)
  "Evaluate BODY when not running under MacOS."
  `(when (not (string-match "apple-darwin" system-configuration)) ,@body))

(defmacro if-running-on-macos (then else)
  "Evaluate THEN when running under MacOS otherwise evaluate ELSE."
  `(if (string-match "apple-darwin" system-configuration)
       ,then
     ,else))

;;;; Create a directory if it does not exist.

(defun troi/maybe-create-directory (dir)
  "If the directory DIR doesn't exist, create it.
There is no meaningful error handling."
  (when (not (file-accessible-directory-p dir))
    (make-directory dir)))

;;;; Add local directories to `load-path'.

;; Add child directories of parent to the `load-path'. This is
;; originally from Purcell.

(defun troi/add-subdirs-to-load-path (parent-dir)
  "Add every non-hidden subdir of PARENT-DIR to `load-path'."
  (let ((default-directory parent-dir))
    (setq load-path
          (append
           (cl-remove-if-not
            #'file-directory-p
            (directory-files
             (expand-file-name parent-dir) t "^[^\\.]"))
           load-path))))

;;;; Tear off a window and move it to a new frame.

;; I usually run with only one maximized frame with two windows at
;; most. But there are times when multiple frames are warranted. This
;; function takes a window from a multi-window frame and puts it in a
;; new frame.

;; This only works if there are multiple windows in the current frame.

;; The original function is from https://stackoverflow.com/a/57318988
;; _How to move a buffer to a new frame_.

;; I typically bind this to C-x 5t.

(defun troi/tear-off-window ()
  "Move a sub-window to a new frame.
From a multi-window frame, tear off the current window and
put it in a new frame."
  (interactive)
  (let ((wc (count-windows)))
    (if (< wc 2)
        (message "only one window")
      (let* ((window (selected-window))
             (buf (window-buffer window))
             (frame (make-frame)))
        (select-frame frame)
        (switch-to-buffer buf)
        (delete-window window)))))


;;;; Narrow focus to selected region:

;; this is from https://speechcode.com/blog/narrow-to-focus/ by arthur
;; a. gleckler.

;; I typically bind this to C-x nf

(defun troi/narrow-to-focus (start end)
  "If the region is active, narrow to region, and mark it.
If the mark is not active, narrow to the region that was
the most recent focus. START and END define the active
region."
  (interactive "r")
  (cond ((use-region-p)
         (remove-overlays (point-min) (point-max) 'focus t)
         (let ((overlay (make-overlay start end)))
           (overlay-put overlay 'focus t)
           (narrow-to-region start end)))
        (t (let ((focus
                  (seq-find (lambda (o) (overlay-get o 'focus))
                            (overlays-in (point-min) (point-max)))))
             (when focus
               (narrow-to-region (overlay-start focus)
                                 (overlay-end focus)))))))

;; (define-key global-map "\C-xnf" 'troi/narrow-to-focus)

;;;; Clear minibuffer message area.

;;;###autoload
(defun troi/clear-minibuffer-message (&rest _)
  "Print an empty message to clear the echo area.
Use this as advice :after a noisy function.

My thanks to Prot!"
  (message ""))


(provide 'init-macros-and-functions)

;;; init-macros-and-functions.el ends here.
