(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
(require 'mu4e)

(defvar ek/gmail-dir-name
  "/Gmail/"
  "Where gmail account begins.")
(defvar ek/gmail-prefix
  (concat ek/gmail-dir-name "[Gmail].")
  "Gmail likes to preface stuff with [Gmail].")

(setq  ek/gmail-dir-sent   (concat ek/gmail-prefix "Sent Mail")
       ek/gmail-dir-drafts (concat ek/gmail-prefix "Drafts")
       ek/gmail-dir-refile (concat ek/gmail-dir-name "archive"))

;; I have my "default" parameters from Gmail.
;; `my-mu4e-set-account' should allow selection from multiple accounts
;;
(setq mu4e-maildir       ek/mail-dir  ; set in `ek-configuration.el'
      mu4e-drafts-folder ek/gmail-dir-drafts
      mu4e-refile-folder ek/gmail-dir-refile
      mu4e-sent-folder   ek/gmail-dir-sent)

(setq smtpmail-smtp-user           ek/smtpmail-smtp-user
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server         "smtp.gmail.com"
      smtpmail-local-domain        "gmail.com"
      smtpmail-smtp-service        587)

;; Now I set an alist for different accounts
(defvar my-mu4e-account-alist
  '(("Gmail"
     (mu4e-sent-folder ek/gmail-dir-sent)
     (user-mail-address ek/gmail-address)
     (smtpmail-smtp-user ek/smtpmail-smtp-user)
     (smtpmail-local-domain "gmail.com")
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-service 587)
     )
    ("TuMail"
     (mu4e-sent-folder ek/gmail-dir-sent)
     (user-mail-address ek/gmail-address)
     (smtpmail-smtp-user ek/smtpmail-smtp-user)
     (smtpmail-local-domain "gmail.com")
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-service 587)
     )
     ;; Include any other accounts here ...
    ))

(defun my-mu4e-set-account ()
  "Set the account for composing a message.
   This function is taken from: 
     https://www.djcbsoftware.nl/code/mu/mu4e/Multiple-accounts.html"
  (let*
      ;; if there is a parent message (perhaps we are replying to an email)
      ;; then `account' will be derived from that
      ((account 
	(if mu4e-compose-parent-message 
	    (let ((maildir (mu4e-message-field
			    mu4e-compose-parent-message
			    :maildir)))             ; "/Gmail/INBOX"
	      (string-match "/\\(.*?\\)/" maildir)  ; 0 (seems unnecessary?)
	      (match-string 1 maildir))             ; "Gmail"

	  ;; if message does not have parent, then prompt user for `account'
	  (completing-read (format "Compose with account: (%s) "
				   (mapconcat #'(lambda (var) (car var))
					      my-mu4e-account-alist "/"))
			   (mapcar #'(lambda (var)
				       (car var)) 
				   my-mu4e-account-alist)
			   nil t nil nil (caar my-mu4e-account-alist))))
       ;; get associated vars from `my-mu4e-account-alist'
       (account-vars (cdr (assoc account my-mu4e-account-alist))))

    ;; if we found an account, then we should have gotten some account vars to set
    (if account-vars
	(mapc #'(lambda (var)
		  (set 
		   (car var)  ; i.e. `smtpmail-local-domain'
		   (cadr var) ; i.e. "smtp.gmail.com"
		   )) 
	      account-vars)
      (error "No email account found"))))

;(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

(defhydra hydra-mu4e-headers (:color blue :hint nil)
  "
 ^General^   | ^Search^           | _!_: read    | _#_: deferred  | ^Switches^
-^^----------+-^^-----------------| _?_: unread  | _%_: pattern   |-^^----------------
_n_: next    | _s_: search        | _r_: refile  | _&_: custom    | _O_: sorting
_p_: prev    | _S_: edit prev qry | _u_: unmk    | _+_: flag      | _P_: threading
_]_: n unred | _/_: narrow search | _U_: unmk *  | _-_: unflag    | _Q_: full-search
_[_: p unred | _b_: search bkmk   | _d_: trash   | _T_: thr       | _V_: skip dups 
_y_: sw view | _B_: edit bkmk     | _D_: delete  | _t_: subthr    | _W_: include-related
_R_: reply   | _{_: previous qry  | _m_: move    |-^^-------------+-^^------------------ 
_C_: compose | _}_: next query    | _a_: action  | _|_: thru shl  | _`_: update, reindex
_F_: forward | _C-+_: show more   | _A_: mk4actn | _H_: help      | _;_: context-switch
_o_: org-cap | _C--_: show less   | _*_: *thing  | _q_: quit hdrs | _j_: jump2maildir "

  ;; general
  ("n" mu4e-headers-next)
  ("p" mu4e-headers-previous)
  ("[" mu4e-select-next-unread)
  ("]" mu4e-select-previous-unread)
  ("y" mu4e-select-other-view)
  ("R" mu4e-compose-reply)
  ("C" mu4e-compose-new)
  ("F" mu4e-compose-forward)
  ("o" ek/org-capture-mu4e)                  ; differs from built-in
  ("C-+" mu4e-headers-split-view-grow)
  ("C--" mu4e-headers-split-view-shrink)

  ;; search
  ("s" mu4e-headers-search)
  ("S" mu4e-headers-search-edit)
  ("/" mu4e-headers-search-narrow)
  ("b" mu4e-headers-search-bookmark)
  ("B" mu4e-headers-search-bookmark-edit)
  ("{" mu4e-headers-query-prev)              ; differs from built-in
  ("}" mu4e-headers-query-next)              ; differs from built-in

  ;; mark stuff 
  ("!" mu4e-headers-mark-for-read)
  ("?" mu4e-headers-mark-for-unread)
  ("r" mu4e-headers-mark-for-refile)
  ("u" mu4e-headers-mark-for-unmark)
  ("U" mu4e-mark-unmark-all)
  ("d" mu4e-headers-mark-for-trash)
  ("D" mu4e-headers-mark-for-delete)
  ("m" mu4e-headers-mark-for-move)
  ("a" mu4e-headers-action)                  ; not really a mark per-se
  ("A" mu4e-headers-mark-for-action)         ; differs from built-in
  ("*" mu4e-headers-mark-for-something)

  ("#" mu4e-mark-resolve-deferred-marks)
  ("%" mu4e-headers-mark-pattern)
  ("&" mu4e-headers-mark-custom)
  ("+" mu4e-headers-mark-for-flag)
  ("-" mu4e-headers-mark-for-unflag)
  ("t" mu4e-headers-mark-subthread)
  ("T" mu4e-headers-mark-thread)

  ;; miscellany
  ("q" mu4e~headers-quit-buffer)
  ("H" mu4e-display-manual)
  ("|" mu4e-view-pipe)

  ;; switches
  ("O" mu4e-headers-change-sorting)
  ("P" mu4e-headers-toggle-threading)
  ("Q" mu4e-headers-toggle-full-search)
  ("V" mu4e-headers-toggle-skip-duplicates)
  ("W" mu4e-headers-toggle-include-related)

  ;; more miscellany
  ("`" mu4e-update-mail-and-index)           ; differs from built-in
  (";" mu4e-context-switch)  
  ("j" mu4e~headers-jump-to-maildir)

  ("." nil))

(bind-keys
 :map mu4e-headers-mode-map

 ("{" . mu4e-headers-query-prev)             ; differs from built-in
 ("}" . mu4e-headers-query-next)             ; differs from built-in
 ("o" . ek/org-capture-mu4e)                 ; differs from built-in

 ("A" . mu4e-headers-mark-for-action)        ; differs from built-in

 ("`" . mu4e-update-mail-and-index)          ; differs from built-in
 ("|" . mu4e-view-pipe)               	     ; does not seem to be built in any longer
 ("." . hydra-mu4e-headers/body))

;; truncate lines when viewing a maildir

(add-hook 'mu4e-headers-found-hook
	  (lambda ()
	    (setq truncate-lines t)))

(setq mu4e-headers-fields
  '( (:human-date    .   10)
     (:flags         .    7)
     ; (:mailing-list  .  4)
     (:from          .   20)
     (:subject       .   100)))

(setq mu4e-headers-results-limit 500)

(setq mu4e-headers-hide-predicate
      (lambda (msg)
	(member 'trashed (mu4e-message-field msg :flags))))

(setf (alist-get 'trash mu4e-marks nil t) nil)

(add-to-list 'mu4e-marks
	     '(trash
	       :char ("d" . "▼")
	       :prompt "dtrash"
	       :dyn-target (lambda (target msg) (mu4e-get-trash-folder msg))
	       :action (lambda (docid msg target) 
			 (mu4e~proc-move docid
					 (mu4e~mark-check-target target) "-N"))))

(bind-keys
 :map mu4e-view-mode-map
	   ("j" . scroll-up-line)
	   ("E" . ek/org-capture-mu4e)
	   ("k" . scroll-down-line)
	   ("J" . mu4e~headers-jump-to-maildir)
	   ("l" . mu4e-view-headers-next)
	   ("h" . mu4e-view-headers-prev)
	   ("H" . mu4e-view-toggle-hide-cited)
	   ("b" . mu4e-headers-search-bookmark)
	   ("o" . mu4e-view-open-attachment)
	   ("U" . mu4e-update-mail-and-index) ;; Get new mail
	   ("e" . mu4e-view-save-attachment)
	   ("Q" . mu4e-raw-view-quit-buffer)
	   ("i" . mu4e~view-quit-buffer)
	   ("." . hydra-mu4e-mark/body)
	   ("C" . mu4e-compose-new))

(setq mu4e-html2text-command 'mu4e-shr2text)

(add-to-list 'mu4e-view-actions
             '("ViewInBrowser" . mu4e-action-view-in-browser) t)



(setq mu4e-maildir-shortcuts
  '( ("/Gmail/INBOX"         . ?i)
     ("/Gmail/archive"       . ?a)
     ("/lists"               . ?l)
     ("/work"                . ?w)
     ("/Gmail/Sent Messages" . ?s)))

(setq mu4e-use-fancy-chars t)

(setq mu4e-completing-read-function 'ivy-completing-read)

(setq mu4e-index-cleanup nil      ;; don't do a full cleanup check
      mu4e-index-lazy-check t)    ;; don't consider up-to-date dirs

(setq mu4e-update-interval 180)  ; update every 3 minutes

(setq message-kill-buffer-on-exit t)

(use-package mu4e-alert
  :ensure t
  :config
  (when (eq system-type 'linux)
    (mu4e-alert-set-default-style 'libnotify))

  (when (eq system-type 'darwin) 
    (mu4e-alert-set-default-style 'growl))
  (add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
  (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display))


(setq mu4e-alert-interesting-mail-query
      (concat
       "flag:unread"
       " AND flag:new"
       " AND NOT flag:trashed"
       " AND NOT maildir:\"/Gmail/archive\""))

(require 'org-mu4e)

(setq org-mu4e-link-query-in-headers-mode nil)

(add-to-list
 'org-capture-templates
 '("o"
   "TODO respond to email"
   entry
   (file ek-org-file-refile-gnrl)
   "* TODO %^{Description}\n%A\n%?\n"))

;; make a shortcut
(defun ek/org-capture-mu4e ()
  (interactive)
  "Capture a TODO item"
  (org-capture nil "o"))
