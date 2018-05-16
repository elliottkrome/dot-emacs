(defhydra hydra-desktop (:color blue)
  "Desktop"
  ("c" desktop-clear "clear")
  ("s" desktop-save "save")
  ("r" desktop-revert "revert")
  ("d" desktop-change-dir "directory"))
(global-set-key "\C-c q" #'hydra-desktop/body)

