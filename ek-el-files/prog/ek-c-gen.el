(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(delete 'company-backends 'company-clang)

(setq irony-user-directory (concat ek/hidden-directory "irony/"))

(use-package cmake-ide
  :ensure t
  :init
  (use-package rtags
    :ensure t)
  (use-package semantic/bovine/gcc)
  (setq cmake-ide-flags-c++
	(append '("-std=c++11")
		(mapcar
		 (lambda (path) (concat "-I" path))
		 (semantic-gcc-get-include-paths "c++"))))
  (setq cmake-ide-flags-c
	(append
	 (mapcar (lambda (path) (concat "-I" path))
		 (semantic-gcc-get-include-paths "c"))))
  (cmake-ide-setup))

(defun ek/occur-cpp-methods ()
  "This is for use in cc implementation files. It depends on the
standard directory structure where the class name (i.e. `Fe') is
the same as the name of the directory holding the implementation
files (i.e. fe_00.cc)"
  (interactive)
  (let* (

        ;; derive class name from directory name
        ;;
        (cc-class-name
         (cadr (reverse (split-string default-directory "/"))))

        ;; get file name (there has got to be simpler way of doing this)
        ;;
        (cc-file-name
         (car (reverse (split-string buffer-file-name "/"))))

        ;; create the name of the occur buffer
        ;;
        (occur-buffer-name
         (concat "*Occur* <" cc-file-name ">")))

    ;; if we had a previous instance of occur open for this file, then kill it
    ;;
    (when (get-buffer occur-buffer-name)
      (kill-buffer occur-buffer-name))

    ;; run occur, looking for occurances of bool <class-name>::
    ;;
    (occur (concat "bool " cc-class-name "::"))

    ;; switch to the newly created occur buffer, and then rename it so
    ;; each file can have its own dedicated buffer
    (switch-to-buffer-other-window "*Occur*")
    (rename-buffer occur-buffer-name)))
