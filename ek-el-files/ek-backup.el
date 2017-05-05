;; set backup directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; prevent "trimming" of old backups
(setq delete-old-versions -1)

;; enable version control!
(setq version-control t)

;; 
(setq vc-make-backup-files t)

