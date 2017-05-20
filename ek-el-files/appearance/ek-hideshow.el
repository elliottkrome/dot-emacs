(use-package hideshow
  :ensure t
  :bind (("C-c TAB" . hs-toggle-hiding)
         ("C-\\" . hs-toggle-hiding)
         ("M-\\" . hs-fold-show-only-methods)
         ("M-+" . hs-show-all)
	 ("C-c S-TAB" . hs-hide-all))
  :init
  (add-hook #'prog-mode-hook #'hs-minor-mode)
  (when (fboundp 'define-fringe-bitmap)
    (define-fringe-bitmap 'hs-marker [16 48 112 240 112 48 16] nil nil 'center))
  (defface hs-face '((t (:background "#ff8")))
    "Face to hightlight the ... area of hidden regions"
    :group 'hideshow)
  (defface hs-fringe-face '((t (:foreground "#888")))
    "Face used to highlight the fringe on folded regions"
    :group 'hideshow)
  (setq 
   hs-isearch-open t))
