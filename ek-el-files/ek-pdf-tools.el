;;; use package declaration
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
  (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo")
  (pdf-tools-install)
  (bind-keys :map pdf-view-mode-map
	     ("\\" . hydra-pdftools/body)
	     ("<s-spc>" .  pdf-view-scroll-down-or-next-page)
	     ("g"  . pdf-view-first-page)
	     ("G"  . pdf-view-last-page)
	     ("h"  . image-backward-hscroll)
	     ("l"  . image-forward-hscroll)
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
	     ("L"  . org-pdfview-store-link)
	     ("s"  . pdf-occur)
	     ("b"  . pdf-view-set-slice-from-bounding-box)
	     ("r"  . pdf-view-reset-slice)))

;;; colors
;; everything below here from
;; http://babbagefiles.blogspot.com/2017/11/more-pdf-tools-tricks.html
;;
(defun ek/pdf-no-filter ()
  "View pdf without colour filter."
  (interactive)
  (pdf-view-midnight-minor-mode -1))

;; change midnight mode colours functions
;;
(defun ek/pdf-midnight-original ()
  "Set pdf-view-midnight-colors to original colours."
  (interactive)
  (setq pdf-view-midnight-colors '("#839496" . "#002b36" )) ; original values
  (pdf-view-midnight-minor-mode))

(defun ek/pdf-midnight-amber ()
  "Set pdf-view-midnight-colors to amber on dark slate blue."
  (interactive)
  (setq pdf-view-midnight-colors '("#ff9900" . "#0a0a12")) ; amber
  (pdf-view-midnight-minor-mode))

(defun ek/pdf-midnight-gray13 ()
  (interactive)
  (setq pdf-view-midnight-colors '("#ffffff" . "gray13"))
  (pdf-view-midnight-minor-mode))

;; not working for some reason, right now is just teal
;;
(defun ek/pdf-midnight-from-default ()
  (interactive)
    (progn
      (setq pdf-view-midnight-colors
	    (cons (face-foreground 'default)
		  (face-background 'default)))
      (pdf-view-midnight-minor-mode)))



(defun ek/pdf-midnight-colour-schemes ()
  "Midnight mode colour schemes bound to keys"
        (local-set-key (kbd "!") (quote ek/pdf-midnight-from-default))
	(local-set-key (kbd "$") (quote ek/pdf-no-filter))
        (local-set-key (kbd "#") (quote ek/pdf-midnight-amber))
        (local-set-key (kbd "$") (quote ek/pdf-midnight-gray13)))

(add-hook 'pdf-view-mode-hook
	  (lambda () (progn (pdf-view-midnight-minor-mode)
			    (ek/pdf-midnight-colour-schemes)		   
			    (ek/pdf-midnight-from-default))))

;;; hydra
(defhydra hydra-pdftools (:color blue :hint nil)
        "
                                                                      ╭───────────┐
       Move  History   Scale/Fit     Annotations  Search/Link    Do   │ PDF Tools │
   ╭──────────────────────────────────────────────────────────────────┴───────────╯
         ^^_g_^^      _B_    ^↧^    _+_    ^ ^     [_al_] list    [_s_] search    [_u_] revert buffer
         ^^^↑^^^      ^↑^    _H_    ^↑^  ↦ _W_ ↤   [_am_] markup  [_o_] outline   [_i_] info
         ^^_p_^^      ^ ^    ^↥^    _0_    ^ ^     [_at_] text    [_F_] link      [_d_] dark mode
         ^^^↑^^^      ^↓^  ╭─^─^─┐  ^↓^  ╭─^ ^─┐   [_ad_] delete  [_f_] search link
    _h_ ←pag_e_→ _l_  _N_  │ _P_ │  _-_    _b_     [_aa_] dired
         ^^^↓^^^      ^ ^  ╰─^─^─╯  ^ ^  ╰─^ ^─╯   [_y_]  yank
         ^^_n_^^      ^ ^  _r_eset slice box       _L_ink-to-page 
         ^^^↓^^^
         ^^_G_^^
   --------------------------------------------------------------------------------
        "
        ("\\" hydra-master/body "back")
        ("<ESC>" nil "quit")
        ("al" pdf-annot-list-annotations)
        ("ad" pdf-annot-delete)
        ("aa" pdf-annot-attachment-dired)
        ("am" pdf-annot-add-markup-annotation)
        ("at" pdf-annot-add-text-annotation)
        ("y"  pdf-view-kill-ring-save)
        ("+" pdf-view-enlarge :color red)
        ("-" pdf-view-shrink :color red)
        ("0" pdf-view-scale-reset)
        ("H" pdf-view-fit-height-to-window)
        ("W" pdf-view-fit-width-to-window)
        ("P" pdf-view-fit-page-to-window)
        ("n" pdf-view-next-page-command :color red)
        ("p" pdf-view-previous-page-command :color red)
        ("d" pdf-view-dark-minor-mode)
        ("b" pdf-view-set-slice-from-bounding-box)
        ("r" pdf-view-reset-slice)
        ("g" pdf-view-first-page)
        ("G" pdf-view-last-page)
        ("e" pdf-view-goto-page)
	("L" org-pdfview-store-link)
        ("o" pdf-outline)
        ("s" pdf-occur)
        ("i" pdf-misc-display-metadata)
        ("u" pdf-view-revert-buffer)
        ("F" pdf-links-action-perfom)
        ("f" pdf-links-isearch-link)
        ("B" pdf-history-backward :color red)
        ("N" pdf-history-forward :color red)
        ("l" image-forward-hscroll :color red)
        ("h" image-backward-hscroll :color red))
