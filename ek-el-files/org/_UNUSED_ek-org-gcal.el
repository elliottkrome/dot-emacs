(setq package-check-signature nil)


(use-package org-gcal
  :ensure t)

(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))

