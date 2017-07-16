(use-package cmake-mode
  :ensure t
  :mode "CMakeLists.txt"
  :init
  (progn
    (setq company-cmake-executable "/usr/local/bin/cmake")))

