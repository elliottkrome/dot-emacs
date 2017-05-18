;;; package -- summary
;;; Commentary:
;;; Code:

(require 'bookmark)

(defun ek-mkdir-p (dir-path)
  (unless (file-exists-p dir-path)
    (make-directory dir-path t)))

;; having a bunch of unnecesary stuff user-emacs-directory makes my
;; ocd bell start ringing. lets make a place to hide this stuff away
;;
(defvar ek-hidden-directory
  (concat user-emacs-directory "hidden/"))

(defvar ek-data-directory
      (concat ek-hidden-directory "data/"))


;; now lets do the actual hiding of those pesky little things
;;
(setq bookmark-default-file
      (concat ek-data-directory "bookmarks"))
(setq ac-comphist-file
      (concat ek-data-directory "ac-comphist.dat"))
(setq recentf-save-file
      (concat ek-data-directory "recentf"))

(provide 'ek-organization)
;;; ek-organization ends here
