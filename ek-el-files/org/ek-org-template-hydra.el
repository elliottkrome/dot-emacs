;; adapted from
;; https://github.com/abo-abo/hydra/wiki/Org-mode-block-templates

;; one of the nice things about this is if a region is active and `<'
;; is pressed, that region is cut, the template is inserted, and the
;; region is inserted inside of that template.

 (defhydra horg-template (:color blue :hint nil)
    "
 _c_enter  _q_uote     _E_lisp    _L_aTeX:
 _l_atex   _e_xample   _P_ython   _i_ndex:
 _a_scii   _v_erse     _O_ctave   _I_NCLUDE:
 _s_rc     C_+_+       _S_hell    _H_TML:
 _h_tml    ^ ^         plant_U_ml _A_SCII:
"
    ("s" (horg-template-expand "<s"))
    ("e" (horg-template-expand "<e"))
    ("q" (horg-template-expand "<q"))
    ("v" (horg-template-expand "<v"))
    ("c" (horg-template-expand "<c"))
    ("l" (horg-template-expand "<l"))
    ("h" (horg-template-expand "<h"))
    ("a" (horg-template-expand "<a"))
    ("L" (horg-template-expand "<L"))
    ("i" (horg-template-expand "<i"))
    ("E" (horg-template-expand "<s" '("elisp")))
    ("P" (horg-template-expand "<s" '("python")))
    ("U" (horg-template-expand "<s" '("plantuml :file CHANGE.png")))
    ("O" horg-template-octave/body :exit t)
    ("+" (horg-template-expand "<s" '("C++ :includes <iostream>")))
    ("S" (horg-template-expand "<s" '("sh")))
    ("I" (horg-template-expand "<I"))
    ("H" (horg-template-expand "<H"))
    ("A" (horg-template-expand "<A"))
    ("<" self-insert-command "ins")
    ("0" nil "quit"))

(define-key org-mode-map "<"
  (lambda () (interactive)
    (if (or (region-active-p) (looking-back "^"))
	(horg-template/body)
      (self-insert-command 1))))

;;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun horg-template-expand (str &optional bgnsrcln-list header)
    "Expand org template

STR is a structure template string recognised by org like <s. BGNSRCLN-LIST is a
string with additional parameters to add the begin line of the
structure element. HEADER string includes more parameters that are
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
      (when header (insert "#+HEADER: " (car header)) (forward-line))

      ;; insert the template to expand, then try to expand it
      ;;
      (insert str)
      (org-try-structure-completion)

      ;; deal with bgnsrcln-list argument
      ;;
      (horg-template--deal-with-bgnsrcln-list-arg bgnsrcln-list)

      ;; move point to be within template, then insert save region, if any
      ;;
      (next-line)
      (when text (insert text))))

(defun horg-template--deal-with-bgnsrcln-list-arg (bgnsrcln-list-arg-list)
  ""

  ;; iterate over each member of bgnsrcln-list-arg-list
  ;;
  (dolist (bgnsrcln-string bgnsrcln-list-arg-list)

    ;; for each string in list, get the associated function, if any
    ;;
    (let ((bgnsrcln-list-string-func (horg--get-bgnsrcln-func bgnsrcln-string)))

      ;; if `bgnsrcln-list-string-func' is a function (it should be), then call it
      ;;
      (if (functionp bgnsrcln-list-string-func)
	  (funcall bgnsrcln-list-string-func)

	;; if nil returned from `horg--get-bgnsrcln-func', then
	;; simply insert bgnsrcln-string with some whitespace
	;;
	(insert (concat bgnsrcln-string " "))))))

(defun horg--get-bgnsrcln-func (bgnsrcln-string)
  (cdr
   (assoc
    bgnsrcln-string
    horg-template--bgnsrcln-str-func-alist)))

(defvar horg-template--bgnsrcln-str-func-alist
      '((":tangle" . horg-template--tangle-function)
	(":" . (insert "asdf")))
      "Associates bgnsrcln-list-list members with functions")

(defvar horg-template--header-str-func-alist
      '(("some_string" . (insert "some_string"))
	("some_str"    . (insert "some_str   "))
      "Associates bgnsrcln-list-list members with functions"))


(defun horg-template--tangle-function ()
  "Function to call when \":tangle\" has been passed to `horg-template--deal-with-bgnsrcln-list-arg'."
  (progn (insert ":tangle ")
	 (insert (read-string "Tangle target: "))))

;;; language specific sub-hydras ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defhydra horg-template-octave  (:color blue :hint nil)
    "
 _t_angle  tangle _&_ session
 _s_ession
"
    ("t" (horg-template-expand "<s" '("octave" ":tangle")))
    ("s" (horg-template-expand "<s" '("octave" ":session")))
    ("&" (horg-template-expand "<s" '("octave" ":table" ":session")))
)
