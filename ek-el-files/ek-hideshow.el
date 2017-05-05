(use-package hideshow
  :ensure t
  :bind (("C-c TAB" . hs-toggle-hiding)
         ("C-\\" . hs-toggle-hiding)
         ("M-\\" . hs-fold-show-only-methods)
         ("M-+" . hs-show-all)
	 ("C-c S-TAB" . hs-hide-all))
  :init
  (add-hook #'prog-mode-hook #'hs-minor-mode)
  (when (fboundp 'define-fringe-bitmap)
    (define-fringe-bitmap 'hs-marker [16 48 112 240 112 48 16] nil nil 'center))
  (defface hs-face '((t (:background "#ff8")))
    "Face to hightlight the ... area of hidden regions"
    :group 'hideshow)
  (defface hs-fringe-face '((t (:foreground "#888")))
    "Face used to highlight the fringe on folded regions"
    :group 'hideshow)
  (setq hs-set-up-overlay
        (lambda (ov)
          (when (eq 'code (overlay-get ov 'hs))
            (let ((marker-string "*")
                  (display-string (format " ... " (count-lines (overlay-start ov)
                                                               (overlay-end ov)))))
              (put-text-property 0 1 'display
                                 (list 'right-fringe 'hs-marker 'hs-fringe-face)
                                 marker-string)
              (put-text-property 0 (length display-string)
                                 'face 'hs-face display-string)
              (overlay-put ov 'before-string marker-string)
              (overlay-put ov 'display display-string))))
        hs-isearch-open t)
  :diminish hs-minor-mode
  :config
  (defvar hs-special-modes-alist
    (mapcar 'purecopy
            '((c-mode "{" "}" "/[*/]" nil nil)
              (c++-mode "{" "}" "/[*/]" nil nil)
              (bibtex-mode ("@\\S(*\\(\\s(\\)" 1))
              (java-mode "{" "}" "/[*/]" nil nil)
              (js-mode "{" "}" "/[*/]" nil)
              (javascript-mode  "{" "}" "/[*/]" nil))))

  (defvar hs-level 2
    "Default level to hide at when calling
    `fold-show-only-methods'. This is buffers may set this to
    be buffer-local.")

  (setq hs-fold-show-only-methods-active-p nil)
  (defun hs-fold-show-only-methods ()
    "Toggle between hiding all methods using `hs-level' or
showing them."
    (interactive)
    (save-excursion
      (if hs-fold-show-only-methods-active-p
          (progn
            (hs-show-all)
            (setq-local hs-fold-show-only-methods-active-p nil))
        (progn
          (goto-char (point-min))
          (hs-hide-level hs-level)
          (setq-local hs-fold-show-only-methods-active-p t))))))

(defun hs-hide-all-comments ()
  "Hide all top level blocks, if they are comments, displaying only first line.
Move point to the beginning of the line, and run the normal hook
`hs-hide-hook'.  See documentation for `run-hooks'."
  (interactive)
  (hs-life-goes-on
   (save-excursion
     (unless hs-allow-nesting
       (hs-discard-overlays (point-min) (point-max)))
     (goto-char (point-min))
     (let ((spew (make-progress-reporter "Hiding all comment blocks..."
                                         (point-min) (point-max)))
           (re (concat "\\(" hs-c-start-regexp "\\)")))
       (while (re-search-forward re (point-max) t)
         (if (match-beginning 1)
           ;; found a comment, probably
           (let ((c-reg (hs-inside-comment-p)))
             (when (and c-reg (car c-reg))
               (if (> (count-lines (car c-reg) (nth 1 c-reg)) 1)
                   (hs-hide-block-at-point t c-reg)
                 (goto-char (nth 1 c-reg))))))
         (progress-reporter-update spew (point)))
       (progress-reporter-done spew)))
   (beginning-of-line)
   (run-hooks 'hs-hide-hook)))
(setq hs-isearch-open t)
(setq hs-hide-comments t)
