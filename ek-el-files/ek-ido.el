;;; package -- summary
;;; Commentary:
;;; Code:

(require 'imenu)

(use-package ido
  :ensure t
  :init
  (progn
    (setq ido-save-directory-list-file (concat ek-data-directory "ido.last"))
    (ido-mode 1)
    (setq ido-use-virtual-buffers t)
    (use-package ido-completing-read+
      :ensure t
      :config
      (ido-ubiquitous-mode 1))
    (use-package ido-vertical-mode
      :ensure t
      :init (ido-vertical-mode 1))
    (use-package ido-occur
      :ensure t)
    (use-package smex
      :ensure t ;smex-save-file
      :init
      (progn
	(setq smex-save-file (concat ek-data-directory "smex-items"))
	(smex-initialize)

	(defadvice smex (around space-inserts-hyphen activate compile)
	  "Insert hyphen in place of whitespace when M-x-ing."
	  (let ((ido-cannot-complete-command
		 `(lambda ()
		    (interactive)
		    (if ((string= ) " " (this-command-keys))
			(insert ?-)
		      (funcall ,ido-cannot-complete-command)))))
	    ad-do-it)))
      :bind (("M-x"         . smex)                       ; replace std M-x
	     ("C-c C-c M-x" . execute-extended-command)  ; keep old M-x herex
	     ))
  :config
  (setq ido-enable-flex-matching               t
        ido-create-new-buffer                  'always
        ido-use-filename-at-point              'guess
        ido-max-prospects                       10
        ido-default-file-method                'selected-window
	ido-default-buffer-method              'selected-window
        ido-auto-merge-work-directories-length -1
	ido-everywhere                          t
	ido-max-directory-size                  100000)))



 (defun ido-goto-symbol (&optional symbol-list)
      "Refresh imenu and jump to a place in the buffer using Ido."
      (interactive)
      (unless (featurep 'imenu)
        (require 'imenu nil t))
      (cond
       ((not symbol-list)
        (let ((ido-mode ido-mode)
              (ido-enable-flex-matching
               (if (boundp 'ido-enable-flex-matching)
                   ido-enable-flex-matching t))
              name-and-pos symbol-names position)
          (unless ido-mode
            (ido-mode 1)
            (setq ido-enable-flex-matching t))
          (while (progn
                   (imenu--cleanup)
                   (setq imenu--index-alist nil)
                   (ido-goto-symbol (imenu--make-index-alist))
                   (setq selected-symbol
                         (ido-completing-read "Symbol? " symbol-names))
                   (string= (car imenu--rescan-item) selected-symbol)))
          (unless (and (boundp 'mark-active) mark-active)
            (push-mark nil t nil))
          (setq position (cdr (assoc selected-symbol name-and-pos)))
          (cond
           ((overlayp position)
            (goto-char (overlay-start position)))
           (t
            (goto-char position)))))
       ((listp symbol-list)
        (dolist (symbol symbol-list)
          (let (name position)
            (cond
             ((and (listp symbol) (imenu--subalist-p symbol))
              (ido-goto-symbol symbol))
             ((listp symbol)
              (setq name (car symbol))
              (setq position (cdr symbol)))
             ((stringp symbol)
              (setq name symbol)
              (setq position
                    (get-text-property 1 'org-imenu-marker symbol))))
            (unless (or (null position) (null name)
                        (string= (car imenu--rescan-item) name))
              (add-to-list 'symbol-names name)
              (add-to-list 'name-and-pos (cons name position))))))))

 ;; TODO: put somewhere reasonable
 (define-key isearch-mode-map (kbd "C-o") 'ido-occur-from-isearch)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; begin kill-ring-ido ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; NOT THE BEST ! ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; search for `flet', this was a cheap fix to avoid dependency in noflet ;;;;;;;;;;;;;;

(defvar kill-ring-ido-shortage-length 10)

(defface kill-ring-ido-number-face
  '((((class color) (background dark))
      :foreground "black"
      :background "gray80")
     (((class color) (background light))
       :foreground "gray80"
       :background "black"))
  "Font for shorten number between beginning and end of text")

(defadvice ido-set-matches-1(around this-is-needed-to-search-through-long-strings)
  "I need to search through long string(with is in cadr, not in car), but outside ido-set-matches, ido-name should be default."
  (flet ((ido-name (item)   ;;; fix this (flet was noflet, but i don't want extraneous dependencies)
		     (if (consp item)
			 (cadr item) item)))
    ad-do-it))
(defun kill-ring-ido(&optional arg prompt ring insert)
  "With RING is nil:
With ARG, use `secondary-selection-ring', else, use `kill-ring'.
Default prompt is set to \"kill-ring\" and \"secondary-kill-ring\" accordingly.
If RING is not nil:
Use RING instead. Default prompt is \"ring\"."
  (interactive "P")
  (if (and (not ring) (member last-command '(yank yank-secondary yank-pop yank-pop-commands)))
    (if (fboundp 'yank-pop-commands)
      (yank-pop-commands) ; second-sel.el
      (yank-pop))
    ;; else
    (if ring
      (unless prompt (setq prompt "ring: "))
      ;; else
      (setq ring (if arg secondary-selection-ring kill-ring))
      (unless prompt (setq prompt (if arg "secondary-selection-ring: " "kill-ring: "))))
    (let ((choices
            (mapcar
              (lambda(arg)
                (list
                  (if (> (length (replace-regexp-in-string "\n" "" (replace-regexp-in-string "^[   ]+" "" arg))) (+ (* 2 kill-ring-ido-shortage-length) 1))
                    (concat
                      (substring (replace-regexp-in-string "\n" "" (replace-regexp-in-string "^[   ]+" "" arg)) 0 kill-ring-ido-shortage-length)
                      (propertize (format "#%d#" (- (length arg) (* 2 kill-ring-ido-shortage-length))) 'face 'kill-ring-ido-number-face)
                      (substring (replace-regexp-in-string "\n" "" (replace-regexp-in-string "^[   ]+" "" arg)) (- kill-ring-ido-shortage-length)))
                    (replace-regexp-in-string "\n" "" (replace-regexp-in-string "^[   ]+" "" arg)))
                  arg))
              ring)))
      (ad-activate 'ido-set-matches-1)
      (prog1
        (let ((answer (progn
                        (ido-completing-read (format (concat "(%d)" prompt) (length ring)) choices)
                        (cadar ido-matches))))
          (insert answer))
        (ad-deactivate 'ido-set-matches-1))
      )))
;;; uncomment for delete-selection-mode
;; (put 'kill-ring-ido 'delete-selection 'yank)


(provide 'ek-ido)
;;; ek-ido ends here


