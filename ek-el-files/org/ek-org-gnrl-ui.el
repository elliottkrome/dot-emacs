(require 'org)


;; local
(add-hook 'org-mode-hook
          (lambda ()
	    (local-set-key "\M-n" 'org-demote-subtree)
            (local-set-key "\M-p" 'org-promote-subtree)
            ;; table
            (local-set-key "\C-\M-w" 'org-table-copy-region)
            (local-set-key "\C-\M-y" 'org-table-paste-rectangle)
            (local-set-key "\C-\M-l" 'org-table-sort-lines)
	    (local-set-key (kbd "<f7>") 'image-new-frame-fitted)
            ;; display images
            (local-set-key "\M-I" 'org-toggle-iimage-in-org)
            ;; fix tab
            (local-set-key "\C-y" 'yank)
	    ))
;; gets rid of org-mode iedit shadowing
(bind-keys :map org-mode-map
	       ("C-c ;" . iedit-mode))
;;;;;;;;;;;;;;;;;; end local keybindings ;;;;;;

;; http://pages.sachachua.com/.emacs.d/Sacha.html#orgheadline54
(defun org-yank-more ()
"Quickly make a link with label 'more'."
  (interactive)
  (insert "[[")
    (yank)
    (insert "][more]]"))

(defun org-yank-hyperlink (arg)
  (interactive
   (list
    (read-string "Description: ")))
  (insert "[[")
  (yank)
  (insert (format "][%s]]" arg)))


;; add a type of link so that the emacs will open the linked file with the
;; default external application (useful for media such as movies, pdfs, etc.)
;;
(defun ek-open-ext (path-to-media)
  (shell-command (concat "open " path-to-media)))
(org-add-link-type "open-ext" 'ek-open-ext)
(add-hook 'org-store-link-functions 'org-ek-store-link)

;; Use IDO for both buffer and file completion and ido-everywhere to t
;;
(setq org-completion-use-ido t)

;; Use the current window for indirect buffer display
;;
(setq org-indirect-buffer-display 'current-window)
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

; (setq org-ellipsis " ↴")

;; makes org open local links with emacs
(add-to-list 'org-file-apps '(directory . emacs))

;; make org-mode default mode for .txt files
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

;; follow link with return
(setq org-return-follows-link t)

(setq org-use-speed-commands t)

(setq org-tags-column 65)

;; org mode will fontify bad links with `org-warning' face (on refontify)
;;
(org-link-set-parameters
 "file"
 :face (lambda (path) (if (file-exists-p path) 'org-link 'org-warning)))

;;; ek-org-gnrl-ui.el ends here
