
(defvar ek-projectile-directory
  (concat ek-hidden-directory "projectile"))

(defvar ek-projectile-cache-filename "projectile.cache"
  "Projectile Cache filename")

(defvar ek-projectile-bookmarks-filename "projectile-bookmarks.eld"
  "Projectile Bookmarks filename")


(use-package projectile
  :ensure    projectile
  :config    (projectile-global-mode t)
  :init      (progn

	       ;; create projectile data folder if non-existent
	       ;;
               (ek-mkdir-p ek-projectile-directory) 

               ;; set projectile custom variables
	       ;;
               (let* ((ek-projectile-dir
		       (file-name-as-directory
			(concat ek-data-directory ek-projectile-directory)))
		      (ek-projectile-cache-;FIXME: le
		       (concat ek-projectile-dir ek-projectile-cache-filename))
		      (ek-projectile-bookmarks-;FIXME: le
		       (concat ek-projectile-dir ek-projectile-bookmarks-filename)))
                 (setq projectile-cache-file          ek-projectile-cache-file
                       projectile-known-projects-file ek-projectile-bookmarks-file
                       projectile-indexing-method     'alien ;; does not work well on windows
                       projectile-enable-caching      t)))
  :diminish   projectile-mode)
