
;; set some modifier keys on mac
;;
(setq mac-right-option-modifier  'super) 
(setq mac-right-command-modifier 'meta) 
(setq ns-function-modifier       'hyper)


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
(global-set-key "\M-n"          'ek-scroll-down)
(global-set-key "\M-p"          'ek-scroll-up)

(global-set-key [remap move-beginning-of-line]
		'smarter-move-beginning-of-line)

;; simplify register usage
;;
(global-set-key "\M-s" 'copy-to-register)
(global-set-key "\M-i" 'insert-register)

;; window management
;;
(global-set-key [f1]                'make-frame)
(global-set-key (kbd "S-C-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>")  'shrink-window)
(global-set-key (kbd "S-C-<up>")    'enlarge-window)
(global-set-key (kbd "M-f1")        'previous-buffer)
(global-set-key (kbd "M-f2")        'next-buffer)
(global-set-key (kbd "s-p")         'windmove-up)
(global-set-key (kbd "s-n")         'windmove-down)
(global-set-key (kbd "s-b")         'windmove-left)
(global-set-key (kbd "s-f")         'windmove-right)
(global-set-key (kbd "H-f")         'toggle-frame-fullscreen)


;; org-mode stuff
;;
(global-set-key (kbd "C-c c")   'org-capture)
(global-set-key (kbd "C-c l")  'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)

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
(define-key ctl-l-map "\C-@"  'transient-mark-mode)
(define-key ctl-l-map "." 'rtags-find-symbol-at-point)
(define-key ctl-l-map "," 'rtags-find-symbol)
(define-key ctl-l-map "b"  'windmove-left)
(define-key ctl-l-map "c" 'comment-or-uncomment-region)
(define-key ctl-l-map "C"  'describe-char)
(define-key ctl-l-map "\C-c" 'calendar)
(define-key ctl-l-map "e" 'show-some-last-messages)
(define-key ctl-l-map "f"  'windmove-right)
(define-key ctl-l-map "F" 'browse-url-of-file)
(define-key ctl-l-map "\C-f"  'projectile-find-file)
(define-key ctl-l-map "g"  'rgrep)
(define-key ctl-l-map "h"  'command-history)
;; (define-key ctl-l-map "i" 'ido-goto-symbol)
(define-key ctl-l-map "i"  'imenu)
(define-key ctl-l-map "j"  'bookmark-jump)
(define-key ctl-l-map "k"  'kill-whole-line)
(define-key ctl-l-map "L"  'ediff-regions-linewise)
(define-key ctl-l-map "\C-l" 'goto-line)
(define-key ctl-l-map "m"  'not-modified)   ;; already at M-~
(define-key ctl-l-map "n"  'windmove-down)
(define-key ctl-l-map "\C-n"  'linum-mode)
(define-key ctl-l-map "o" 'ido-occur)
(define-key ctl-l-map "O" 'ido-occur-at-point)
(define-key ctl-l-map "\C-o"  'ek-show-python-tags)
(define-key ctl-l-map "p"  'windmove-up)
(define-key ctl-l-map "q"  'query-replace)
(define-key ctl-l-map "Q"  'query-replace-regexp)
(define-key ctl-l-map "\C-q" 'fill-region)  ;; check it out
(define-key ctl-l-map "r"  'replace-string)
(define-key ctl-l-map "R"  'replace-regexp)
(define-key ctl-l-map "\C-r" 'isearch-backward-regexp)
(define-key ctl-l-map "s" 'shell)
(define-key ctl-l-map "S" 'ek-switch-to-scratch)
(define-key ctl-l-map "\C-s" 'isearch-forward-regexp)
(define-key ctl-l-map "t" 'term)
(define-key ctl-l-map "T"  'delete-trailing-whitespace)
(define-key ctl-l-map "U" 'browse-url)
(define-key ctl-l-map "\C-u" 'undo-only)
(define-key ctl-l-map "v" 'visual-line-mode)
(define-key ctl-l-map "w"  'write-region) ;; this looks cool, how do use it?
;; (define-kwy ctl-l-map "w" 'workspace-goto)
(define-key ctl-l-map "W"  'ediff-regions-wordwise)
(define-key ctl-l-map "\C-w"  'kill-rectangle)
(define-key ctl-l-map "y" 'yas-insert-snippet)
(define-key ctl-l-map "\C-y"  'yank-rectangle)
