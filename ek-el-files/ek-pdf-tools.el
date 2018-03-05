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

