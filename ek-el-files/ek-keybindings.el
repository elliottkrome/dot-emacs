;;; package --- Summary
;;; Commentary:

;;; Code:
; https://www.masteringemacs.org/article/mastering-key-bindings-emacs

;; TODO: put somewhere reasonable
(define-key isearch-mode-map (kbd "C-o") 'ido-occur-from-isearch)


(global-unset-key [f1])
(global-unset-key [f2])
(global-unset-key [f11])

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key [f1] 'make-frame)
(global-set-key (kbd "<S-f1>") 'dired-other-frame)
(global-set-key (kbd "<M-f1>") 'previous-buffer)
(global-set-key (kbd "<s-f2>") 'jump-to-register)
(global-set-key (kbd "<M-f2>") 'next-buffer)
(global-set-key (kbd "<M-f3>") 'elmacro-mode)
(global-set-key (kbd "<M-f4>") 'elmacro-show-last-macro)
;;f5 is reserved for mode-specific bindings
;;f6 is reserved for mode-specific bindings
;;f7 is reserved for mode-specific bindings
;; (global-set-key (kbd "<f9>") 'yas-insert-snippet)
;; (global-set-key (kbd "<S-f9>") 'yas-new-snippet)
(global-set-key [f11] 'apropos)
(global-set-key (kbd "<M-f11>")'describe-mode)
(global-set-key (kbd "<ESC-f11>")'describe-key)
(global-set-key (kbd "<S-f11>") 'describe-bindings)
(global-set-key [f12] 'agenda-new-frame)
(global-set-key (kbd "<S-f12>") 'make-capture-frame)

(global-set-key (kbd "<s-k>") 'kill-this-buffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; <C-c c> to start capture mode in same frame
(global-set-key (kbd "C-c c") 'org-capture)

;; if you want to bind a key to insert some text, do like this
(global-set-key (kbd "C-c 8") "some text")



(global-set-key (kbd "C-c f") 'find-file-at-point)
;; allows to quickly return to mark (where ya pressed the space bar dummy)
(global-set-key (kbd "C-x p") 'pop-to-mark-command)
(setq set-mark-command-repeat-pop t)
;; remap C-a to `smarter-move-beginning-of-line
(global-set-key [remap move-beginning-of-line]
		'smarter-move-beginning-of-line)



;simplify register usage
(global-set-key "\M-s" 'copy-to-register)
(global-set-key "\M-i" 'insert-register)
(global-set-key (kbd "C-c i") 'info-lookup-symbol)

;;http://whattheemacsd.com/key-bindings.el-03.html
(global-set-key (kbd "M-j")
		(lambda ()
		  (interactive)
		  (join-line -1)))



; make right option key super key
(setq mac-right-option-modifier 'super)

; make right command key meta key
(setq mac-right-command-modifier 'meta)

;;; fn key becomes hyper-modifer 'H-*'
; (setq ns-function-modifier 'hyper)



;; movement commands
(define-key global-map [?\s-p] 'windmove-up)
(define-key global-map [?\s-n] 'windmove-down)
(define-key global-map [?\s-b] 'windmove-left)
(define-key global-map [?\s-f] 'windmove-right)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(global-set-key "\M-n" (lambda () (interactive) (scroll-up 8)))
(global-set-key "\M-p" (lambda () (interactive) (scroll-down 8)))



(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)
(define-key org-mode-map (kbd "<f5>") 'org-deadline)
(global-set-key (kbd "<f6>") 'org-yank-more)


;; http://stackoverflow.com/questions/5682631/what-are-good-custom-keybindings-in-emacs
;;
(global-unset-key "\C-l")
(defvar ctl-l-map (make-keymap)
     "Keymap for local bindings and functions, prefixed by (^L).")
(define-key global-map "\C-l" 'Control-L-prefix)
(fset 'Control-L-prefix ctl-l-map)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key ctl-l-map "c" 'comment-or-uncomment-region)
(define-key ctl-l-map "j"  'bookmark-jump)
(define-key ctl-l-map "p"  'windmove-up)
(define-key ctl-l-map "n"  'windmove-down)
(define-key ctl-l-map "f"  'windmove-right)
(define-key ctl-l-map "b"  'windmove-left)
(define-key ctl-l-map "\C-f"  'projectile-find-file)
(define-key ctl-l-map "i"  'imenu)
(define-key ctl-l-map "g"  'rgrep)
(define-key ctl-l-map "r"  'replace-string)
(define-key ctl-l-map "R"  'replace-regexp)
(define-key ctl-l-map "q"  'query-replace)
(define-key ctl-l-map "Q"  'query-replace-regexp)
(define-key ctl-l-map "k"  'kill-whole-line)
(define-key ctl-l-map "o" 'ido-occur)
(define-key ctl-l-map "O" 'ido-occur-at-point)
(define-key ctl-l-map "\C-o"  'ek-show-python-tags)
(define-key ctl-l-map "\C-w"  'kill-rectangle)
(define-key ctl-l-map "\C-y"  'yank-rectangle)
(define-key ctl-l-map "h"  'command-history)
(define-key ctl-l-map "w"  'write-region) ;; this looks cool, how do use it?
(define-key ctl-l-map "T"  'delete-trailing-whitespace)
(define-key ctl-l-map "C"  'describe-char)
(define-key ctl-l-map "W"  'ediff-regions-wordwise)
(define-key ctl-l-map "L"  'ediff-regions-linewise)
(define-key ctl-l-map "\C-l" 'goto-line)
(define-key ctl-l-map "\C-c" 'calendar)
(define-key ctl-l-map "m"  'not-modified)   ;; already at M-~
(define-key ctl-l-map "\C-q" 'fill-region)  ;; check it out
(define-key ctl-l-map [?\C-2] 'transient-mark-mode)
(define-key ctl-l-map "\C-@"  'transient-mark-mode)
(define-key ctl-l-map "\C-n"  'linum-mode)
(define-key ctl-l-map "\C-s" 'isearch-forward-regexp)
(define-key ctl-l-map "\C-r" 'isearch-backward-regexp)
(define-key ctl-l-map "U" 'browse-url)
(define-key ctl-l-map "F" 'browse-url-of-file)
(define-key ctl-l-map "\C-u" 'undo-only)
(define-key ctl-l-map "t" 'term)
(define-key ctl-l-map "v" 'visual-line-mode)
(define-key ctl-l-map "s" 'shell)
(define-key ctl-l-map "i" 'ido-goto-symbol)
(define-key ctl-l-map "e" 'show-some-last-messages)
(define-key ctl-l-map "S" (switch-to-buffer (get-buffer-create "*scratch*")))
(define-key ctl-l-map "y" 'yas-insert-snippet)
(define-key ctl-l-map "." 'rtags-find-symbol-at-point)
(define-key ctl-l-map "," 'rtags-find-symbol)
;; (define-kwy ctl-l-map "w" 'workspace-goto)
(provide 'ek-keybindings)
;;; ek-keybindings ends here
