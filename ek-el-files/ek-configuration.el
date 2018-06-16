;;; variables that should be set on a per-machine basis go here,
;;   and should probably be set here as well.
;;

(defvar ek/use-ivy t
  "Use `ivy' or `ido' as my completing-read-function.")
(defvar ek/use-mu4e t
  "If mu4e is configured on this machine, then we should use it.")
(defvar ek/use-ligatures nil
  "Use fancy ligatures.

Can get kind of annoying (doesn't necessarily play nice with mono-spacing)")

(setq ek/use-ivy       t
      ek/use-mu4e      t
      ek/use-ligatures nil)
