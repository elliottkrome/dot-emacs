
(load "~/.emacs.d/ek-el-files/appearance/ek-mode-line.el")
(load "~/.emacs.d/ek-el-files/appearance/ek-window-behavior.el")
(load "~/.emacs.d/ek-el-files/appearance/ek-font-lock.el")
(load "~/.emacs.d/ek-el-files/appearance/ek-hideshow.el")
(load "~/.emacs.d/ek-el-files/appearance/ek-icons.el")

; (load "~/.emacs.d/ek-el-files/appearance/theme/leuven.el")
; (load "~/.emacs.d/ek-el-files/appearance/theme/jazz.el")
; (load "~/.emacs.d/ek-el-files/appearance/ek-theme-custom.el")
; (load "~/.emacs.d/ek-el-files/appearance/theme/material.el")
(load "~/.emacs.d/ek-el-files/appearance/theme/ek-material.el")



;; (not a great use of time)
;; aesthetics - just playing with some frame appearance stuff
;; 
(if (eq system-type 'darwin)
    (setq initial-frame-alist
	  `((scroll-bar-background . "gray54") ; emacs-mac build lets you color toolbar ("gray55" works well with dark-mode on mac, "Palevioletred3" is fun)
	    (background-color      . "gray13")
	    (alpha                 . (100 . 100))
	    (scroll-bar-width      . 0))
	  default-frame-alist (copy-alist initial-frame-alist)))


;; i think this was the first non-trivial elisp i ever messed around
;; with. i'm keeping it around for nostalgia's sake.
;;
;; (defun highlight-selected-window ()
;;   "Highlight un-selected windows with a different background color."
;;   (walk-windows (lambda (w)
;; 		  (if (not (eq w (minibuffer-window)))
;; 		      (unless (eq w (selected-window))
;; 			(with-current-buffer (window-buffer w)
;; 			  (buffer-face-set '(:background "gray12")))))))
;;   (buffer-face-set 'default))
;; (add-hook 'buffer-list-update-hook 'highlight-selected-window)








;; fonts / ligatures
(mac-auto-operator-composition-mode) 

(when (window-system)
  (set-frame-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))
