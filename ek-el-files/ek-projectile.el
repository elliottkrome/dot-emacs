
(defvar ek-projectile-directory
  (concat ek-data-directory "projectile/"))

(defvar ek-projectile-cache-file "projectile.cache"
  "Projectile Cache filename")

(defvar ek-projectile-bookmarks-file "projectile-bookmarks.eld"
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
               (let* ((ek-projectile-cache-file
		       (concat ek-projectile-directory ek-projectile-cache-file))
		      (ek-projectile-bookmarks-file
		       (concat ek-projectile-directory ek-projectile-bookmarks-file)))
                 (setq projectile-cache-file          ek-projectile-cache-file
                       projectile-known-projects-file ek-projectile-bookmarks-file
                       projectile-indexing-method     'alien ;; does not work well on windows
                       projectile-enable-caching      t)))
  :diminish   projectile-mode)
