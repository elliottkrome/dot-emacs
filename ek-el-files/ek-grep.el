(eval-after-load "grep"
  '(progn
    (add-to-list 'grep-find-ignored-files "*.pdf")
     (add-to-list 'grep-find-ignored-directories "elpa/archives")
     (add-to-list 'grep-find-ignored-directories "elpa/pkg-info*")))
