(setq ek-hidden-directory
      (concat user-emacs-directory
	      (convert-standard-filename "hidden/")))

(setq ek-data-directory
      (concat ek-hidden-directory
	      (convert-standard-filename "data/")))


(setq bookmark-default-file
      (concat ek-data-directory "bookmarks"))

(setq ac-comphist-file
      (concat ek-data-directory "ac-comphist.dat"))

(setq recentf-save-file
      (concat ek-data-directory "recentf"))
