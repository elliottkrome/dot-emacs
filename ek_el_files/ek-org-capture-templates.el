;;; package --- Summary
;;; Commentary:

; much taken from http://doc.norang.ca/org-mode.html
;; http://orgmode.org/manual/Template-elements.html
;; http://orgmode.org/manual/Template-expansion.html

;;; Code:

(setq org-capture-templates
      (quote (("t" "TODO no time no file link"
	       entry (file "~/Dropbox/org/refile.org")
               "* TODO %^{Description}\n%?\n")

	      ("T" "TODO with time no file link"
	       entry (file "~/Dropbox/org/refile.org")
               "* TODO %^{Description}\n %?\n%^T\n")

	      ("f" "TODO no time with file link"
	       entry (file "~/Dropbox/org/refile.org")
               "* TODO %^{Description}\n%A\n%?\n")

	      ("F" "TODO with time with file link"
	       entry (file "~/Dropbox/org/refile.org")
               "* TODO %^{Description}\n%^T\n%A\n%?\n")

	      ("h" "HW TODO with time no file link"
	       entry (file "~/Dropbox/org/hw.org")
               "* TODO %^{Description}\n %?\n%^T\n")

	      ("H" "HW TODO with time with file link"
	       entry (file "~/Dropbox/org/hw.org")
               "* TODO %^{Description}\n%^T\n%A\n%?\n")

	      ("E" "Event (one time event) with file link"
	       entry (file "~/Dropbox/org/refile.org")
               "* %^{Description}\n%^T\n%A\n%?\n")

	      ("a" "application"
	       entry (file "~/Dropbox/org/applications.org")
               "* %^{Description}\n%?\n")

	      ("g" "gift"
	       entry (file "~/Documents/gift_ideas.org")
               "* NAME: %? \n GIFT: \n")
	      	      
              ("r" "respond"
	       entry (file "~/Dropbox/org/refile.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" ::timestamp t :immediate-finish t)

	      ("R" "Recipe"
	       entry (file "~/Dropbox/org/misc_stuff/recipes.org")
               "* %^{Description}\n%?\n")

	      ("M" "Music"
	       entry (file "~/Dropbox/org/misc_stuff/music.org")
               "* %^{Description}\n%?\n")

	      ("B" "Books"
	       entry (file "~/Dropbox/org/misc_stuff/books.org")
               "* %^{Description}\n%?\n")

	      ("C" "Cinema"
	       entry (file "~/Dropbox/org/misc_stuff/cinema.org")
               "* %^{Description}\n%?\n")
	      
	      ("n" "note no file link"
	       entry (file "~/Dropbox/org/notes/notes_to_refile.org")
               "* %^{Description}%?\n")

	      ("N" "note with link to current file"
	       entry (file "~/Dropbox/org/notes/notes_to_refile.org")
               "* %^{Description}%?\n%A\n")
	      
              ("j" "journal"
	       entry (file+datetree "~/Dropbox/org/diary.org")
               "* %?\n%U\n")

	      ("o" "org-protocol"
	       entry (file "~/Dropbox/org/refile.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)

	      ("m" "meeting"
	       entry (file "~/Dropbox/org/refile.org")
               "* MEETING with %? :MEETING:\n%U" :timestamp t)

	      ("b" "stuff to buy"
	       entry (file "~/Dropbox/org/misc_stuff/purchase_list.org")
               "* TODO %^{Description}\n%?\n")
	      
	      ("p" "phone call"
	       entry (file "~/Dropbox/org/refile.org")
               "* PHONE %? :PHONE:\n%U" :timestamp t)

	      ("W" "weekly with time"
	       entry (file "~/Dropbox/org/misc_stuff/weekly.org")
               "* %^{****REMEMBER TO ADD +1W TO TIMESTAMP****    Description:}\n%^T\n%?\n")
	      
	      ("h" "habit"
	       hentry (file "~/Dropbox/org/refile.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")

	      ("*" "empty asterisked entry (just example for now)"
	       entry (file "~/Dropbox/org/refile.org")
               "* %?\n")
	      
	      ("1" "chem"
	       entry (file "~/Dropbox/org/notes/gen_chem.org")
               "* %^{Description}%?\n")

	      ("2" "microE"
	       entry (file "~/Dropbox/org/notes/microelectronics.org")
               "* %^{Description}%?\n")

	      ("3" "sen design"
	       entry (file "~/Dropbox/org/notes/sen_design.org")
               "* %^{Description}%?\n")

	      ("4" "mech systems"
	       entry (file "~/Dropbox/org/notes/mech_systems.org")
               "* %^{Description}%?\n")

	      ("5" "power"
	       entry (file "~/Dropbox/org/notes/power.org")
               "* %^{Description}%?\n")
	      )))

(provide 'org_capture_templates)
;;; org_capture_templates.el ends here
