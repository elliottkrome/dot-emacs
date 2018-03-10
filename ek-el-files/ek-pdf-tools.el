;; from https://emacs.stackexchange.com/questions/13314/install-pdf-tools-on-emacs-macosx
;;
;; Install epdfinfo via 'brew install pdf-tools' and then install the pdf-tools
;; elisp via the use-package below. To upgrade the epdfinfo server, just do
;; 'brew upgrade pdf-tools' prior to upgrading to newest pdf-tools package
;; using Emacs package system. If things get messed up, just do 'brew uninstall
;; pdf-tools', wipe out the elpa pdf-tools package and reinstall both as at the
;; start.
(use-package pdf-tools
  :ensure t
  :config
  (custom-set-variables
   '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead.
  (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo")
  (bind-keys :map pdf-view-mode-map
	     ("<s-spc>" .  pdf-view-scroll-down-or-next-page)
	     ("g"  . pdf-view-first-page)
	     ("G"  . pdf-view-last-page)
	     ("l"  . image-forward-hscroll)
	     ("h"  . image-backward-hscroll)
	     ("j"  . pdf-view-next-page)
	     ("k"  . pdf-view-previous-page)
	     ("e"  . pdf-view-goto-page)
	     ("u"  . pdf-view-revert-buffer)
	     ("al" . pdf-annot-list-annotations)
	     ("ad" . pdf-annot-delete)
	     ("aa" . pdf-annot-attachment-dired)
	     ("am" . pdf-annot-add-markup-annotation)
	     ("at" . pdf-annot-add-text-annotation)
	     ("y"  . pdf-view-kill-ring-save)
	     ("i"  . pdf-misc-display-metadata)
	     ("s"  . pdf-occur)
	     ("b"  . pdf-view-set-slice-from-bounding-box)
	     ("r"  . pdf-view-reset-slice)))

(pdf-tools-install)

;; everything below here from
;; http://babbagefiles.blogspot.com/2017/11/more-pdf-tools-tricks.html
;;
(defun ek-pdf-no-filter ()
  "View pdf without colour filter."
  (interactive)
  (pdf-view-midnight-minor-mode -1))

;; change midnight mode colours functions
(defun ek-pdf-midnight-original ()
  "Set pdf-view-midnight-colors to original colours."
  (interactive)
  (setq pdf-view-midnight-colors '("#839496" . "#002b36" )) ; original values
  (pdf-view-midnight-minor-mode))

(defun ek-pdf-midnight-amber ()
  "Set pdf-view-midnight-colors to amber on dark slate blue."
  (interactive)
  (setq pdf-view-midnight-colors '("#ff9900" . "#0a0a12")) ; amber
  (pdf-view-midnight-minor-mode))

(defun ek-pdf-midnight-from-default ()
  (interactive)
  (setq pdf-view-midnight-colors '("#ffffff" . "#263238"))
  (pdf-view-midnight-minor-mode))

(defun ek-pdf-midnight-colour-schemes ()
  "Midnight mode colour schemes bound to keys"
        (local-set-key (kbd "!") (quote ek-pdf-no-filter))
        (local-set-key (kbd "@") (quote ek-pdf-midnight-amber)) 
        (local-set-key (kbd "#") (quote ek-pdf-midnight-from-default)))

(add-hook 'pdf-view-mode-hook
	  (lambda () (progn (pdf-view-midnight-minor-mode)
			    (ek-pdf-midnight-colour-schemes)		   
			    (ek-pdf-midnight-from-default))))
