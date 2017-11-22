;; testing
(global-set-key (kbd "M-y") 'kill-ring-ido)


;; set some modifier keys on mac
;; perhaps preface with ns-* on a different machine
;;
(setq mac-right-option-modifier  'super) 
(setq mac-right-command-modifier 'meta)
(setq mac-command-modifier       'super)
(setq mac-function-modifier      'hyper)

;; frame command shortcuts
;;
(global-set-key (kbd "s-w") 'delete-frame)
(global-set-key (kbd "s-<left>") 'other-frame)
(global-set-key (kbd "s-<right>") (lambda () (interactive) (other-frame -1)))

;; if you want to bind a key to insert some text, do like this
;;
(global-set-key (kbd "C-c 8") "some text")

;; general editing preferences
;;
(global-set-key (kbd "<M-f3>")  'elmacro-mode)
(global-set-key (kbd "<M-f4>")  'elmacro-show-last-macro)
(global-set-key (kbd "C-c i")   'info-lookup-symbol)
(global-set-key (kbd "C-x k")   'kill-this-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c f")   'find-file-at-point)
(global-set-key (kbd "C-x p")   'pop-to-mark-command)
(global-set-key (kbd "M-j")     'ek-join-next-line)
(global-set-key (kbd "M-n")     'ek-scroll-down)
(global-set-key (kbd "M-p")    'ek-scroll-up)
;; (global-set-key [remap move-beginning-of-line]
;;	  	   'smarter-move-beginning-of-line)

;; simplify register usage
;;
(global-set-key "\M-s" 'copy-to-register)
(global-set-key "\M-i" 'insert-register)

;; window management
;;
(global-set-key (kbd "<f1>")        'make-frame)
(global-set-key (kbd "S-C-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>")  'shrink-window)
(global-set-key (kbd "S-C-<up>")    'enlarge-window)
(global-set-key (kbd "<M-f1>")      'previous-buffer)
(global-set-key (kbd "<M-f2>")      'next-buffer)
(global-set-key (kbd "s-p")         'windmove-up)
(global-set-key (kbd "s-n")         'windmove-down)
(global-set-key (kbd "s-b")         'windmove-left)
(global-set-key (kbd "s-f")         'windmove-right)
(global-set-key (kbd "H-f")         'toggle-frame-fullscreen)
(define-key org-mode-map (kbd "S-C-<left>")  nil) ;;; unset some stuff in 
(define-key org-mode-map (kbd "S-C-<right>") nil) ;;  org-mode-map to allow
(define-key org-mode-map (kbd "S-C-<up>")    nil) ;;  some keybindings to work
(define-key org-mode-map (kbd "S-C-<down>")  nil) ;;  across all modes
(define-key org-mode-map (kbd "M-a")  nil)        ;;

;; make some octave-mode shell interaction available from within org-mode
;;
(define-key org-mode-map "\C-c\C-i" 'nil)
(define-key org-mode-map "\C-c\C-il" 'octave-send-line)
(define-key org-mode-map "\C-c\C-ib" 'octave-send-block)
(define-key org-mode-map "\C-c\C-if" 'octave-send-defun)
(define-key org-mode-map "\C-c\C-ir" 'octave-send-region)
(define-key org-mode-map "\C-c\C-ia" 'octave-send-buffer)
(define-key org-mode-map "\C-c\C-is" 'octave-show-process-buffer)
(define-key org-mode-map "\C-c\C-iq" 'octave-hide-process-buffer)


;; org-mode stuff
;;
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "M-a")   'ek-switch-to-agenda)
(global-set-key (kbd "M-A")   'ek-agenda-new-frame)
(global-set-key (kbd "M-0")   'ek-org-capture-todo)
(global-set-key (kbd "M-9")   'ek-org-capture-knowledge)

;; create the ctrl-l keymap
;; http://stackoverflow.com/questions/5682631/what-are-good-custom-keybindings-in-emacs
;;
(global-unset-key "\C-l")
(defvar ctl-l-map (make-keymap)
     "Keymap for local bindings and functions, prefixed by (^L).")
(define-key global-map "\C-l" 'control-l-prefix)
(fset 'control-l-prefix ctl-l-map)

;; define the ctrl-l keymap
;;
(define-key ctl-l-map "\C-@" 'transient-mark-mode)
(define-key ctl-l-map "."    'rtags-find-symbol-at-point)
(define-key ctl-l-map ","    'rtags-find-symbol)
(define-key ctl-l-map "b"    'windmove-left)
(define-key ctl-l-map "c"    'comment-or-uncomment-region)
(define-key ctl-l-map "C"    'describe-char)
(define-key ctl-l-map "\C-c" 'calendar)
(define-key ctl-l-map "d"    'dired-jump)
(define-key ctl-l-map "e"    'show-some-last-messages)
(define-key ctl-l-map "f"    'windmove-right)
(define-key ctl-l-map "F"    'browse-url-of-file)
(define-key ctl-l-map "\C-f" 'projectile-find-file)
(define-key ctl-l-map "g"    'rgrep)
(define-key ctl-l-map "h"    'command-history)
;; (define-key ctl-l-map "i"    'ido-goto-symbol)
(define-key ctl-l-map "i"    'imenu)
(define-key ctl-l-map "j"    'bookmark-jump)
(define-key ctl-l-map "J"    'bookmark-set)
(define-key ctl-l-map "k"    'kill-whole-line)
(define-key ctl-l-map "L"    'ediff-regions-linewise)
(define-key ctl-l-map "\C-l" 'goto-line)
(define-key ctl-l-map "m"    'not-modified)   ;; already at M-~
(define-key ctl-l-map "n"    'windmove-down)
(define-key ctl-l-map "\C-n" 'linum-mode)
(define-key ctl-l-map "o"    'ido-occur)
(define-key ctl-l-map "O"    'ido-occur-at-point)
(define-key ctl-l-map "\C-o" 'ek-show-python-tags)
(define-key ctl-l-map "p"    'windmove-up)
(define-key ctl-l-map "q"    'query-replace)
(define-key ctl-l-map "Q"    'query-replace-regexp)
(define-key ctl-l-map "\C-q" 'fill-region)  ;; check it out
(define-key ctl-l-map "r"    'replace-string)
(define-key ctl-l-map "R"    'replace-regexp)
(define-key ctl-l-map "\C-r" 'isearch-backward-regexp)
(define-key ctl-l-map "s"    'shell)
(define-key ctl-l-map "S"    'ek-switch-to-scratch)
(define-key ctl-l-map "\C-s" 'isearch-forward-regexp)
(define-key ctl-l-map "t"    'ek-org-babel-tangle-file)
(define-key ctl-l-map "T"    'delete-trailing-whitespace)
(define-key ctl-l-map "U"    'browse-url)
(define-key ctl-l-map "\C-u" 'undo-only)
(define-key ctl-l-map "v"    'visual-line-mode)
(define-key ctl-l-map "w"    'write-region) ;; this looks cool, how do use it?
;; (define-kwy ctl-l-map ""w    'workspace-goto)
(define-key ctl-l-map "W"    'ediff-regions-wordwise)
(define-key ctl-l-map "\C-w" 'kill-rectangle)
(define-key ctl-l-map "y"    'yas-insert-snippet)
(define-key ctl-l-map "\C-y" 'yank-rectangle)
(define-key ctl-l-map "1"    'org-mobile-push)
(define-key ctl-l-map "2"    'org-mobile-pull)
(define-key ctl-l-map "|"    'go-to-column)
