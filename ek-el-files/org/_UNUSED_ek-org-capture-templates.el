; much taken from http://doc.norang.ca/org-mode.html
;; http://orgmode.org/manual/Template-elements.html
;; http://orgmode.org/manual/Template-expansion.html

;;; Code:
(require 'org)

(defvar org-capture-templates)
(setq org-capture-templates
      (quote
       (("t" "TODO no time no file link"
	 entry (file ek/org-file-refile-gnrl)
	 "* TODO %^{Description}\n%?\n")

	("T" "TODO with time no file link"
	 entry (file ek/org-file-refile-gnrl)
	 "* TODO %^{Description}\n %?\n%^T\n")

	("f" "TODO no time with file link"
	 entry (file ek/org-file-refile-gnrl)
	 "* TODO %^{Description}\n%A\n%?\n")

	("F" "TODO with time with file link"
	 entry (file ek/org-file-refile-gnrl)
	 "* TODO %^{Description}\n%^T\n%A\n%?\n")

	("h" "HW TODO with time no file link"
	 entry (file ek/org-file-assignments)
	 "* TODO %^{Description}\n %?\n%^T\n")

	("H" "HW TODO with time with file link"
	 entry (file  ek/org-file-assignments)
	 "* TODO %^{Description}\n%^T\n%A\n%?\n")

	("E" "Event (one time event) with file link"
	 entry (file ek/org-file-refile-gnrl)
	 "* %^{Description}\n%^T\n%A\n%?\n")

	("a" "application"
	 entry (file ek/org-file-applications)
	 "* %^{Description}\n%?\n")

	("g" "gift"
	 entry (file ek/org-file-gifts)
	 "* NAME: %? \n GIFT: \n")
	      	      
	("r" "respond"
	 entry (file ek/org-file-refile-gnrl)
	 "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n"
	 ::timestamp t :immediate-finish t)

	("R" "Recipe"
	 entry (file ek/org-file-recipes)
	 "* %^{Description}\n%?\n")

	("M" "Music"
	 entry (file ek/org-file-music)
	 "* %^{Description}\n%?\n")

	("B" "Books"
	 entry (file ek/org-file-books)
	 "* %^{Description}\n%?\n")

	("C" "Cinema"
	 entry (file ek/org-file-cinema)
	 "* %^{Description}\n%?\n")
	      
	("n" "note no file link"
	 entry (file ek/org-file-refile-notes)
	 "* %^{Description}%?\n")

	("N" "note with link to current file"
	 entry (file ek/org-file-refile-notes)
	 "* %^{Description}%?\n%A\n")
	      
	("j" "journal"
	 entry (file+datetree ek/org-file-diary)
	 "* %?\n%U\n")

	("o" "org-protocol"
	 entry (file ek/org-file-refile-gnrl)
	 "* TODO Review %c\n%U\n" :immediate-finish t)

	("m" "meeting"
	 entry (file ek/org-file-refile-gnrl)
	 "* MEETING with %? :MEETING:\n%U" :timestamp t)

	("b" "stuff to buy"
	 entry (file ek/org-file-purchase)
	 "* TODO %^{Description}\n%?\n")
	      
	("p" "phone call"
	 entry (file ek/org-file-refile-gnrl)
	 "* PHONE %? :PHONE:\n%U" :timestamp t)

	("W" "weekly with time"
	 entry (file ek/org-file-weekly)
	 "* %^{****REMEMBER TO ADD +1W TO TIMESTAMP****
Description:}\n%^T\n%?\n")
	      
	("h" "habit"
	 entry (file ek/org-file-refile-gnrl)
	 "* NEXT %?\n%U\n%a\nSCHEDULED:
%(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n
:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")

	("*" "empty asterisked entry (just example for now)"
	 entry (file ek/org-file-refile-gnrl)
	 "* %?\n"))))

