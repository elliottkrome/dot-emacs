; alias emm="emacs -nw -Q --load /Users/elk/.emacs.d/init-minimal.el"
; alias semm="sudo emacs -nw -Q --load /Users/elk/.emacs.d/init-minimal.el"

;; dired
;;
(defun ek/dired-setup ()
  (progn
    (auto-revert-mode)
    (dired-hide-details-mode 1)))

(add-hook 'dired-mode-hook 'ek/dired-setup)


;; keybindings
;;

;; general editing preferences
(global-set-key (kbd "<M-f3>")  'elmacro-mode)
(global-set-key (kbd "<M-f4>")  'elmacro-show-last-macro)
(global-set-key (kbd "C-x k")   'kill-this-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c f")   'find-file-at-point)
(global-set-key (kbd "C-x p")   'pop-to-mark-command)
(global-set-key (kbd "M-j")     'ek/join-next-line)
(global-set-key (kbd "M-n")     'ek/scroll-up)
(global-set-key (kbd "M-p")     'ek/scroll-down)
;; simplify register usage
(global-set-key "\M-s" 'copy-to-register)
(global-set-key "\M-i" 'insert-register)
;; org-mode stuff
(global-set-key (kbd "C-c l") 'org-store-link)
;; create the ctrl-l keymap
(global-unset-key "\C-l")
(defvar ctl-l-map (make-keymap)
     "Keymap for local bindings and functions, prefixed by (^L).")
(define-key global-map "\C-l" 'control-l-prefix)
(fset 'control-l-prefix ctl-l-map)
;; define the ctrl-l keymap
(define-key ctl-l-map "\C-@" 'transient-mark-mode)
(define-key ctl-l-map "b"    'windmove-left)
(define-key ctl-l-map "c"    'comment-or-uncomment-region)
(define-key ctl-l-map "C"    'describe-char)
(define-key ctl-l-map "\C-c" 'calendar)
(define-key ctl-l-map "d"    'dired-jump)
(define-key ctl-l-map "e"    'show-some-last-messages)
(define-key ctl-l-map "f"    'windmove-right)
(define-key ctl-l-map "F"    'browse-url-of-file)
(define-key ctl-l-map "g"    'rgrep)
(define-key ctl-l-map "h"    'command-history)
(define-key ctl-l-map "H"    'org-yank-hyperlink)
(define-key ctl-l-map "i"    'imenu)
(define-key ctl-l-map "j"    'bookmark-jump)
(define-key ctl-l-map "J"    'bookmark-set)
(define-key ctl-l-map "k"    'kill-whole-line)
(define-key ctl-l-map "L"    'ediff-regions-linewise)
(define-key ctl-l-map "\C-l" 'goto-line)
(define-key ctl-l-map "M"    'not-modified)   ;; already at M-~
(define-key ctl-l-map "n"    'windmove-down)
(define-key ctl-l-map "\C-n" 'linum-mode)
(define-key ctl-l-map "p"    'windmove-up)
(define-key ctl-l-map "q"    'query-replace)
(define-key ctl-l-map "Q"    'query-replace-regexp)
(define-key ctl-l-map "\C-q" 'fill-region)  ;; check it out
(define-key ctl-l-map "r"    'replace-string)
(define-key ctl-l-map "R"    'replace-regexp)
(define-key ctl-l-map "\C-r" 'isearch-backward-regexp)
(define-key ctl-l-map "s"    'shell)
(define-key ctl-l-map "\C-s" 'isearch-forward-regexp)
(define-key ctl-l-map "T"    'toggle-truncate-lines)
(define-key ctl-l-map "U"    'browse-url)
(define-key ctl-l-map "\C-u" 'undo-only)
(define-key ctl-l-map "v"    'visual-line-mode)
(define-key ctl-l-map "w"    'write-region) ;; this looks cool, how do use it?
(define-key ctl-l-map "W"    'ediff-regions-wordwise)
(define-key ctl-l-map "\C-w" 'kill-rectangle)
(define-key ctl-l-map "y"    'yas-insert-snippet)
(define-key ctl-l-map "\C-y" 'yank-rectangle)
(define-key ctl-l-map "1"    'org-mobile-push)
(define-key ctl-l-map "2"    'org-mobile-pull)
(define-key ctl-l-map "|"    'go-to-column)

