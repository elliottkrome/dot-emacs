;; having a bunch of unnecesary stuff user-emacs-directory makes my
;; ocd bell start ringing. lets make a place to hide this stuff away
;;
(setq ek-hidden-directory
      (concat user-emacs-directory "hidden/"))
(setq ek-data-directory
      (concat ek-hidden-directory "data/"))

;; now lets do the actual hiding of those pesky little things
;;
(setq bookmark-default-file
      (concat ek-data-directory "bookmarks"))
(setq ac-comphist-file
      (concat ek-data-directory "ac-comphist.dat"))
(setq recentf-save-file
      (concat ek-data-directory "recentf"))
