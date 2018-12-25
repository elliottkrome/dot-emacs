;;; package -- summary
;;; Commentary:
;;; Code:

(require 'org)

;; allow emphasized regions to also end with a "s"
;;
(setcar (nthcdr 1 org-emphasis-regexp-components)
	(concat (nth 1 org-emphasis-regexp-components) "s"))

;; visual line mode by default
;;
; (add-hook 'org-mode-hook #'visual-line-mode)

(use-package org-bullets
  :ensure t
  :commands org-bullets-mode)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-startup-indented      nil  ; indentation (?)
      org-hide-leading-stars    t    ; hide stars, MAYBE UNNECESSARY
      org-hide-emphasis-markers t    ; make *bold* look plain, like bold
      org-src-fontify-natively  t    ;
      org-image-actual-width    550  ; rescale pixel-width of inline images
      org-bullets-bullet-list '("#") ; no bullets
      org-pretty-entities        t
      org-ellipsis " ↴"
      org-entities-user '(("join" "\\Join" nil "&#9285;" "" "" "⋈")
			   ("Reals" "\\mathbb{R}" t "&#8477;" "" "" "ℝ")
			   ("Ints" "\\mathbb{Z}" t "&#8484;" "" "" "ℤ")
			   ("Complex" "\\mathbb{C}" t "&#2102;" "" "" "ℂ")
			   ("models" "\\models" nil "&#8872;" "" "" "⊧"))
      )

;; alternative org-bullets-bullet-list vals
; '(" ")
; '("•")
; '("◇" "►" "⚫" "✸" "✿" "◉" "○")

(defvar ek/org-mlh-change-factor
  1.1
  "How much to scale height of `org-meta-line' when calling
`ek/org-meta-line-increase'. `ek/org-meta-line-decrease' uses the
inverse value.")

(defvar ek/org-mlh-default-height
  (/ 1 ek/org-mlh-change-factor)
  "Redefines the default height of `org-meta-line'.
I like to make it one increment less than 1 by default")

(defun ek/org-mlh--set (new-height-arg)
  "Do the actual setting of height of `org-meta-line'.

Might not be worthy of being abstracted into a function, but it is nice to:
1) Allow for easy reuse.
2) Put any safety checks in one place.
3) Perhaps add further manipulation (perhaps `org-document-info-keyword'?)"
  (let ((new-height-safe (if (< new-height-arg 0.1)
			     0.1
			   new-height-arg)))
    (progn
      ; (set-face-attribute 'org-document-info-keyword nil :height new-height-safe)
      (set-face-attribute 'org-meta-line nil :height new-height-safe)
      (set-face-attribute 'org-block-end-line nil :height new-height-safe)
      (set-face-attribute 'org-block-begin-line nil :height new-height-safe))))

(defun ek/org-mlh--change (arg)
  "Manipulate the height of face `org-meta-line'.

If ARG is non-nil, set height to (* current-height ARG)
If ARG is nil, reset to default height (1.0)

Meant to wrapped by helper functions which can then be bound to keys."
  (let* ((current-height (face-attribute 'org-meta-line :height))
	 (new-height (if (eq arg nil)
			 ek/org-mlh-default-height
		       (* arg current-height))))
    (ek/org-mlh--set new-height)))


(defun ek/org-mlh-increase ()
  "Increase the height of `org-meta-line' by `ek/org-mlh-change-factor'."
    (interactive)
    (ek/org-mlh--change ek/org-mlh-change-factor))


(defun ek/org-mlh-decrease ()
  "Decrease the height of `org-meta-line' by `ek/org-mlh-change-factor'."
    (interactive)
    (ek/org-mlh--change (/ 1 ek/org-mlh-change-factor)))


(defun ek/org-mlh-reset ()
  "Reset the height of `org-meta-line' to `ek/org-mlh-default-height'."
    (interactive)
    (ek/org-mlh--change nil))

;; go ahead and set the default height
(ek/org-mlh--set ek/org-mlh-default-height)

(provide 'ek/org-formatting)
;;; ek/org-formatting ends here
