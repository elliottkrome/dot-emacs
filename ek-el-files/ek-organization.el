(require 'bookmark)

(defun ek-mkdir-p (dir-path)
  "If the directory at dir-path does not exist, then make it."
  (unless (file-exists-p dir-path)
    (make-directory dir-path t)))

;; having a bunch of unnecesary stuff user-emacs-directory makes my
;; ocd bell start ringing. lets make a place to hide this stuff away
;;
(defvar ek-hidden-directory
  (concat user-emacs-directory "hidden/"))

(defvar ek-data-directory
      (concat ek-hidden-directory "data/"))


;; now hide those pesky little things
;;
(setq bookmark-default-file
      (concat ek-data-directory "bookmarks"))
(setq ac-comphist-file
      (concat ek-data-directory "ac-comphist.dat"))
(setq recentf-save-file
      (concat ek-data-directory "recentf"))

