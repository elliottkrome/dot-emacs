
(electric-pair-mode 1)
(put 'narrow-to-region 'disabled nil)

(setq set-mark-command-repeat-pop t)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Why not just use M-m (`back-to-indentation')?
;;
;; (defun smarter-move-beginning-of-line (arg)
;;     "Move point back to indentation of beginning of line.

;; Move point to the first non-whitespace character on this line.
;; If point is already there, move to the beginning of the line.
;; Effectively toggle between the first non-whitespace character and
;; the beginning of the line.

;; If ARG is not nil or 1, move forward ARG - 1 lines first.  If
;; point reaches the beginning or end of the buffer, stop there."
;;     (interactive "^p")
;;     (setq arg (or arg 1))

;;     ;; Move lines first
;;     (when (/= arg 1)
;;       (let ((line-move-visual nil))
;; 	(forward-line (1- arg))))

;;     (let ((orig-point (point)))
;;       (back-to-indentation)
;;       (when (= orig-point (point))
;; 	(move-beginning-of-line 1))))


;; http://stackoverflow.com/questions/17136216/emacs-shortcut-to-move-cursor-to-column-adding-spaces-if-needed

;;
(defun go-to-column (column)
  "Go to COLUMN, adding spaces if need be."
  (interactive "ntarget column: ")
  (move-to-column column t))


;; http://pages.sachachua.com/.emacs.d/Sacha.html
;;
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
    (if mark-active (list (region-beginning) (region-end))
      (list (line-beginning-position)
        (line-beginning-position 2)))))

; ignore case when searching
(setq case-fold-search t)

(defun ek/join-next-line ()
  "Join next line to end of current line."
  (interactive
   (join-line -1)))

(defun ek/scroll-up ()
  "Scroll up a reasonable amount"
  (interactive
   (scroll-up 8)))


(defun ek/scroll-down ()
  "Scroll down a reasonable amount"
  (interactive
   (scroll-down 8)))

;; (use-package browse-kill-ring
;;   :ensure t
;;   :config
;;   (browse-kill-ring-default-keybindings))


(use-package fold-dwim
  :ensure t
  :config
  (progn
    (defhydra hydra-fold (:pre (hs-minor-mode 1))
      "fold"
      ("t" fold-dwim-toggle "toggle")
      ("h" fold-dwim-hide-all "hide-all")
      ("s" fold-dwim-show-all "show-all")
      ("q" nil "quit"))
    (global-set-key (kbd "C-`") 'hydra-fold/body)
    ))

(defhydra hydra-splitter (global-map "C-M-s")
  "splitter"
  ("h" hydra-move-splitter-left)
  ("j" hydra-move-splitter-down)
  ("k" hydra-move-splitter-up)
  ("l" hydra-move-splitter-right))

(defun hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun hydra-move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))
