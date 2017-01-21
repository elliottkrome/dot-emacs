#+BEGIN_SRC elisp
(find-file "~/Dropbox/org/notes")
(find-file "~/Dropbox/org/refile.org")

(find-file "~/Emacs-Elisp-Programming")
(find-file "~/Dropbox/org/notes/elisp.org")
(find-file "/usr/local/Cellar/emacs/24.5/share/emacs/24.5/lisp")

(browse-url "http://planet.emacsen.org/")
(browse-url "http://sachachua.com/blog/category/geek/emacs/emacs-news/")
(browse-url "http://steve-yegge.blogspot.com/2008/01/emergency-elisp.html")
(browse-url "https://www.gnu.org/software/emacs/manual/html_node/elisp/Advising-Functions.html")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Whatever can be done another day can be done today. ;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-'     -> org-edit-special   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-c f   -> find-file-at-point ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-x r b -> bookmark-jump      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-c a   -> see agenda         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-c i   -> info-lookup-symbol ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; M-C-x   -> eval-defun         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bar-open)
(suggest)      ;; oo-wee nice!
(elmacro-mode) ;; oo-wee nice!

(setq w (current-window-configuration))
(set-window-configuration w)

(insert (shell-command-to-string "pwd"))

(run-with-timer
 1            ;; do in five seconds
 nil          ;; do not repeat
 (lambda ()
   (shell-command-to-string
    "say \"i am emacs\"")))

(split-window-vertically)
(setq dummy-buffer (get-buffer-create "dummy"))
(switch-to-buffer-other-window dummy-buffer)
(set-buffer dummy-buffer)
(insert "Testing Emacs GUI capabilities")
(print (shell-command-to-string "pwd") dummy-buffer)

(load-library "chart.el")
(chart-space-usage "~/Dropbox/")

(global-set-key (kbd "<C-x k>") 'kill-buffer)
#+END_SRC

#+BEGIN_SRC python
        # an instance for separating just useful channels inside edf file.
        # Using this technique we  are filtering some channels with 1 Hz
        # sampling.
        #
        self.channels = None
        self.channels = []

        # read the lines that contains the final montage
        #
        lines = [line.strip() for line in open(self.demo_directory
            + self.d_sep_char + 'tmp' + self.d_sep_char + 'full_montage.txt')]
        for line in lines:
            parts1 = line.split("=")
            parts2 = parts1[1].split("--")
            self.channels.append(parts2[0].strip())
            self.channels.append(parts2[1].strip())
        #
        # end of for

        self.channels = list(set(self.channels))

        self.physical_channels = h['label']
        for x in self.channels:
            if x.lower() != "none":
                self.physical_channels.remove(x)
        #
        # end of for
#+END_SRC
