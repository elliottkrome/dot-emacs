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
    (use-package ido-ubiquitous
      :ensure t
      :config
      (ido-ubiquitous-mode +1))
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
	     ("C-c C-c M-x" . 'execute-extended-command)  ; keep old M-x herex
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
	ido-max-directory-size                  100000))



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



(provide 'ek-ido)
;;; ek-ido ends here
