;; make scratch buffer persistent between sessions without saving
;;

(setq scratch-buffer-file (concat ek/data-directory "scratch.el"))
(setq initial-major-mode 'org-mode)

(setq initial-scratch-message "")             ; initial message
(add-hook 'kill-emacs-hook 'scratch-save)     ;  
(add-hook 'window-setup-hook 'scratch-resume) ; 

;;  window-setup-hook 
;;  @see info 38.1.1 Summary: Sequence of Actions at Startup
(add-hook 'kill-buffer-hook; *scratch* 
          (lambda ()
            (if (equal (buffer-name) "*scratch*") (scratch-save))))

(add-hook 'after-save-hook        
          (lambda ()
            (unless (get-buffer "*scratch*") (scratch-resume))))


(defun scratch-save ()
  (let ((buf (get-buffer "*scratch*")))
    (when buf
      (set-buffer buf)
      (write-file scratch-buffer-file)
      (ignore-errors (kill-buffer "scratch.el")))))

(defun scratch-resume ()
  "*scratch* "
  (interactive)
  (set-buffer (get-buffer-create "*scratch*"))
  (funcall initial-major-mode)
  (insert-file-contents scratch-buffer-file nil nil nil t)
  
  (ignore-errors (kill-buffer ".scratch")))

(provide 'ek/scratch.el)
;;; ek/scratch.el ends here
