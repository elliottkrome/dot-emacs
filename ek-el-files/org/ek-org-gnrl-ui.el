;;; package -- summary
;;; Commentary:
;;; Code:

(require 'org)
(require 'ido)

(defun org-mode-turn-off-company-hook ()
  "Turn off company mode for org."
  (company-mode -1))

(add-hook 'org-mode-hook 'org-mode-turn-off-company-hook)
;; ****************__END_TEST_AREA__****************************

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
            (local-set-key "\C-y" 'yank)))
;;;;;;;;;;;;;;;;;; end local keybindings ;;;;;;

;; http://pages.sachachua.com/.emacs.d/Sacha.html#orgheadline54
  (defun org-yank-more ()
"Quickly make a link with label 'more'."
  (interactive)
  (insert "[[")
    (yank)
  (insert "][more]]"))

; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

;; makes org open local links with emacs
(add-to-list 'org-file-apps '(directory . emacs))

;; make org-mode default mode for .txt files
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

;; follow link with return
(setq org-return-follows-link t)


(provide 'ek-org-gnrl-ui)
;;; ek-org-gnrl-ui.el ends here
