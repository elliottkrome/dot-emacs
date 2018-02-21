(use-package scad-mode
  :ensure
  :init
   (when (eq system-type 'darwin)
    (setq scad-command "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD")))
