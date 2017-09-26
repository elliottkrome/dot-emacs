
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


(defhydra hydra-projectile-other-window (:color teal)
  "projectile-other-window"
  ("f"  projectile-find-file-other-window        "file")
  ("g"  projectile-find-file-dwim-other-window   "file dwim")
  ("d"  projectile-find-dir-other-window         "dir")
  ("b"  projectile-switch-to-buffer-other-window "buffer")
  ("q"  nil                                      "cancel" :color blue))

(defhydra hydra-projectile (:color teal
                            :hint nil)
  "
     PROJECTILE: %(projectile-project-root)

     Find File            Search/Tags          Buffers                Cache
------------------------------------------------------------------------------------------
_s-f_: file            _a_: ag                _i_: Ibuffer           _c_: cache clear
 _ff_: file dwim       _g_: update gtags      _b_: switch to buffer  _x_: remove known project
 _fd_: file curr dir   _o_: multi-occur     _s-k_: Kill all buffers  _X_: cleanup non-existing
  _r_: recent file                                               ^^^^_z_: cache current
  _d_: dir

"
  ("a"   projectile-ag)
  ("b"   projectile-switch-to-buffer)
  ("c"   projectile-invalidate-cache)
  ("d"   projectile-find-dir)
  ("s-f" projectile-find-file)
  ("ff"  projectile-find-file-dwim)
  ("fd"  projectile-find-file-in-directory)
  ("g"   ggtags-update-tags)
  ("s-g" ggtags-update-tags)
  ("i"   projectile-ibuffer)
  ("K"   projectile-kill-buffers)
  ("s-k" projectile-kill-buffers)
  ("m"   projectile-multi-occur)
  ("o"   projectile-multi-occur)
  ("s-p" projectile-switch-project "switch project")
  ("p"   projectile-switch-project)
  ("s"   projectile-switch-project)
  ("r"   projectile-recentf)
  ("x"   projectile-remove-known-project)
  ("X"   projectile-cleanup-known-projects)
  ("z"   projectile-cache-current-file)
  ("`"   hydra-projectile-other-window/body "other window")
  ("q"   nil "cancel" :color blue))
