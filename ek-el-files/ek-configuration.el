;;; variables that should be set on a per-machine basis go here,
;;   and should probably be set here as well.
;;


;;; switches
;;
(defvar ek/use-ivy
  t
  "Use `ivy' or `ido' as my completing-read-function.")

(defvar ek/use-mu4e
  t
  "If mu4e is configured on this machine, then we should use it.")

(defvar ek/use-ligatures
  nil
  "Use fancy ligatures.")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; other
;;
(defvar ek/mail-dir
  (expand-file-name "~/mail")
  "If mu4e is configured on this machine, then we should use it.")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

