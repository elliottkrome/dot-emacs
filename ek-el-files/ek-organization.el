

(setq ek-data-directory
      (concat user-emacs-directory
	      (convert-standard-filename "data/")))


(setq bookmark-default-file
      (concat ek-data-directory "bookmarks"))

(setq auto-save-list-file-prefix
      (concat ek-data-directory "auto-save-list/.saves-"))

(setq ac-comphist-file
      (concat ek-data-directory "ac-comphist.dat"))

(setq recentf-save-file
      (concat ek-data-directory "ac-comphist.dat"))
