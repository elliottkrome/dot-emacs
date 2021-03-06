;; adapted from
;; https://github.com/abo-abo/hydra/wiki/Org-mode-block-templates

;; Required from org 9 onwards for old template expansion
(require 'org-tempo) 
;; Reset the org-template expnsion system, this is need after upgrading to org 9 for some reason
(setq org-structure-template-alist
       (eval (car (get 'org-structure-template-alist 'standard-value))))

;; one of the nice things about this is if a region is active and `<'
;; is pressed, that region is killed, the template is inserted, and the
;; region is yanked inside of that template.

(defhydra horg-template (:color blue :hint nil)
    "
 _c_lisp   _q_uote     _E_lisp    _R_       _L_aTeX:   
 _l_atex   _e_xample   _P_ython   _v_erilog _i_ndex:
 _a_scii   _v_erse     _O_ctave             _I_NCLUDE:
 _s_rc     C_+_+       _S_hell              _H_TML:
 _h_tml    _d_ot       plant_U_ml           _A_SCII:
"
    ("s" (horg-template-expand "<s"))
    ("e" (horg-template-expand "<e"))
    ("q" (horg-template-expand "<q"))
    ("v" (horg-template-expand "<s" '("verilog")))
    ("c" horg-template-clisp/body :exit t)
    ("l" (horg-template-expand "<l"))
    ("h" (horg-template-expand "<h"))
    ("a" (horg-template-expand "<s" '("asm")))
    ("d" (horg-template-expand "<s"'("dot :file :export results")))    
    ("L" (horg-template-expand "<L"))
    ("i" (horg-template-expand "<i"))
    ("E" (horg-template-expand "<s" '("elisp")))
    ("P" horg-template-python/body :exit t)
    ("U" (horg-template-expand "<s" '("plantuml :file CHANGE.png")))
    ("O" horg-template-octave/body :exit t)
    ("+" (horg-template-expand "<s" '("C++")))
    ("S" (horg-template-expand "<s" '("sh")))
    ("I" (horg-template-expand "<I"))
    ("H" (horg-template-expand "<H"))
    ("A" (horg-template-expand "<A"))
    ("R" horg-template-R/body :exit t)
    ("<" self-insert-command "ins")
    ("0" nil "quit"))

;; override default `<' behaviour
(define-key org-mode-map "<"
  (lambda ()
    (interactive)
    ;; if there either there is no active region or we are not at beginning of line
    ;; then just insert `<'. otherwise do the thing.
    (if (or (region-active-p) (looking-back "^"))
	(horg-template/body)
      (self-insert-command 1))))

;;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun horg-template-expand (str &optional mainline-list header-list)
    "Expand org template

STR is a structure template string recognised by org like
<s. MAINLINE-LIST is a list of strings with additional parameters
to add the to the begin line of the structure element. HEADER is
a list of strings that includes more parameters that are
prepended to the element after the #+HEADER: tag."

    ;; if the region is active, kill it temporarily
    ;;
    (let (text)
      (when (region-active-p)
	(setq text (buffer-substring (region-beginning) (region-end)))
	(delete-region (region-beginning) (region-end))
	(deactivate-mark))

      ;; deal with header argument
      ;;
      (horg-template--deal-with-header-list header-list)

      ;; insert the template to expand, then try to expand it
      ;;
      (insert str)
      (org-tempo-complete-tag)

      ;; deal with mainline-list argument
      ;;
      (horg-template--deal-with-mainline-list mainline-list)

      ;; move point to be within template, then insert save region, if any
      ;;
      (next-line)
      (when text (insert text))))

(defun horg-template--deal-with-mainline-list (mainline-list)
  "The second (and optional) argument to `horg-template-expand'
is a list of strings associated with the mainline of the
structure element. Each of these strings might have an associated
function (via `horg-template--mainline-str-func-alist'), or might
be inserted verbatim."
  ;; iterate over each member of mainline-list
  (dolist (mainline-string mainline-list)
    ;; for each string in list, get the associated function, if any
    (let ((mainline-list-string-func (horg--get-mainline-func mainline-string)))
      ;; if `mainline-list-string-func' is a function (it should be
      ;; either `nil' or a function), then call it.
      (if (functionp mainline-list-string-func)
	  (funcall mainline-list-string-func)
	;; if nil returned from `horg--get-mainline-func', then
	;; simply insert mainline-string with some whitespace
	(insert (concat mainline-string " "))))))


(defun horg-template--deal-with-header-list (header-list)
  "The third (and optional) argument to `horg-template-expand'
is a list of strings associated with the headers of the
structure element. Each of these strings might have an associated
function (via `horg-template--header-str-func-alist'), or might
be inserted verbatim."

  ;; iterate over each member of header-list
  (dolist (header-string header-list)
    ;; for each string in list, get the associated function, if any
    (let ((header-list-string-func (horg--get-header-func header-string)))
      (progn
	(insert "#+HEADER: ")
	;; if `header-list-string-func' is a function (it should be
	;; either `nil' or a function), then call it.
	(if (functionp header-list-string-func)
	    (funcall header-list-string-func)
	  ;; if nil returned from `horg--get-header-func', then
	  ;; simply insert header-string with some whitespace
	  (insert (concat header-string " ")))))))

(defun horg--get-mainline-func (mainline-string)
  (cdr (assoc mainline-string horg-template--mainline-str-func-alist)))

(defun horg--get-header-func (header-string)
  (cdr (assoc header-string horg-template--header-str-func-alist)))

;;; mainline functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar horg-template--mainline-str-func-alist
  "Associates mainline-list members with functions")
(setq horg-template--mainline-str-func-alist
      '((":tangle" . horg-template--tangle-function)
	(":var"    . horg-template--var-function)))

(defun horg-template--tangle-function ()
  "Function to call when \":tangle\" has been passed to `horg-template--deal-with-mainline-list'."
  (progn (insert ":tangle ")
	 (insert (concat (read-string "Tangle target: ") " "))))

(defun horg-template--var-function ()
  "Function to call when \":var\" has been passed to `horg-template--deal-with-mainline-list'."
  (progn (insert ":var ")
	 (insert (concat (read-string "Variable expression: ") " "))))

;;; heaeder functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar horg-template--header-str-func-alist
  '(("some_string" . horg-template--header-example-function)
    ("some_str"    . (insert "some_str   ")))
  "Associates header-list members with functions")

(defun horg-template--header-example-function ()
    ""
  (progn (insert "some_poor_soul")
	 (open-line 1)
	 (next-line)))

;;; language specific sub-hydras ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defhydra horg-template-octave  (:color blue :hint nil)
    "
 _t_angle  tangle _&_ session
 _s_ession _p_lain
"
    ("t" (horg-template-expand "<s" '("octave" ":tangle")))
    ("s" (horg-template-expand "<s" '("octave" ":session")))
    ("p" (horg-template-expand "<s" '("octave" "")))
    ("&" (horg-template-expand "<s" '("octave" ":tangle" ":session") '("some_string"))))

(defhydra horg-template-clisp  (:color blue :hint nil)
    "
 _t_angle  tangle _&_ session
 _s_ession _p_lain
"
    ("t" (horg-template-expand "<s" '("lisp" ":tangle")))
    ("s" (horg-template-expand "<s" '("lisp" ":session")))
    ("p" (horg-template-expand "<s" '("lisp" "")))
    ("&" (horg-template-expand "<s" '("lisp" ":tangle" ":session") '("some_string"))))


(defhydra horg-template-python  (:color blue :hint nil)
    "
 _t_angle  tangle _&_ session _S_ession, silent results
 _s_ession _r_esults silent   _v_ar
 _p_lain
"
    ("t" (horg-template-expand "<s" '("python" ":tangle")))
    ("v" (horg-template-expand "<s" '("python" ":var")))
    ("s" (horg-template-expand "<s" '("python" ":session")))
    ("p" (horg-template-expand "<s" '("python" "")))    
    ("r" (horg-template-expand "<s" '("python" ":results silent")))
    ("S" (horg-template-expand "<s" '("python" ":session" ":results silent")))
    ("&" (horg-template-expand "<s" '("python" ":tangle" ":session") '("some_string"))))

(defhydra horg-template-R  (:color blue :hint nil)
    "
 _p_lain   _r_esout
"
    ("p" (horg-template-expand "<s" '("R")))
    ("r" (horg-template-expand "<s" '("R" ":results output"))))
