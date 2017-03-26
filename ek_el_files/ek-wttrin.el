; http://pragmaticemacs.com/2016/05/

(use-package wttrin
  :ensure t
  :commands (wttrin)
  :init
  (setq wttrin-default-cities '("Philadelphia")))


;;advise wttrin to save frame arrangement
;;requires frame-cmds package
(defun elk/wttrin-save-frame ()
  "Save frame and window configuration and then expand frame for wttrin."
  ;;save window arrangement to a register
  (window-configuration-to-register :pre-wttrin)
  (delete-other-windows)
  ;;save frame setup and resize
  (save-frame-config)
  (set-frame-width (selected-frame) 130)
  (set-frame-height (selected-frame) 48))
(advice-add 'wttrin :before #'elk/wttrin-save-frame)

(defun elk/wttrin-restore-frame ()
  "Restore frame and window configuration saved prior to launching wttrin."
  (interactive)
  (jump-to-frame-config-register)
  (jump-to-register :pre-wttrin))
(advice-add 'wttrin-exit :after #'elk/wttrin-restore-frame)

;; function to open wttrin with first city on list
(defun elk/wttrin ()
    "Open `wttrin' without prompting, using first city in `wttrin-default-cities'."
    (interactive)
    ;; save window arrangement to register 
    (window-configuration-to-register :pre-wttrin)
    (delete-other-windows)
    ;; save frame setup
    (save-frame-config)
    (set-frame-width (selected-frame) 130)
    (set-frame-height (selected-frame) 48)
    ;; call wttrin
    (wttrin-query (car wttrin-default-cities)))


