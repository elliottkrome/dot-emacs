
(electric-pair-mode 1)
(put 'narrow-to-region 'disabled nil)


(defun smarter-move-beginning-of-line (arg)
    "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
    (interactive "^p")
    (setq arg (or arg 1))

    ;; Move lines first
    (when (/= arg 1)
      (let ((line-move-visual nil))
	(forward-line (1- arg))))

    (let ((orig-point (point)))
      (back-to-indentation)
      (when (= orig-point (point))
	(move-beginning-of-line 1))))


; http://stackoverflow.com/questions/17136216/emacs-shortcut-to-move-cursor-to-column-adding-spaces-if-needed
(defun go-to-column (column)
  "Go to COLUMN, adding spaces if need be."
  (interactive "nColumn: ")
  (move-to-column column t))


;; http://pages.sachachua.com/.emacs.d/Sacha.html
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
    (if mark-active (list (region-beginning) (region-end))
      (list (line-beginning-position)
        (line-beginning-position 2)))))

; ignore case when searching
(setq case-fold-search t)


(use-package browse-kill-ring
  :ensure t
  :config
  (browse-kill-ring-default-keybindings))
