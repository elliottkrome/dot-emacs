(setenv "PKG_CONFIG_PATH"
	(concat
	 "/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig" ":"
	 "/usr/local/lib/pkgconfig"                   ":"
	 "/opt/X11/lib/pkgconfig"
	 (getenv "PKG_CONFIG_PATH")
	 )
	)
(use-package tablist
  :ensure t)
(use-package pdf-tools
  :ensure t
   :config
    (pdf-tools-install)
    (setq-default pdf-view-display-size 'fit-page)
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

