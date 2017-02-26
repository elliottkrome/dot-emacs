


(eval-after-load "grep"
  '(progn
    (add-to-list 'grep-find-ignored-files "*.pdf")
     (add-to-list 'grep-find-ignored-directories "elpa/archives")
     (add-to-list 'grep-find-ignored-directories "elpa/pkg-info*")))

(fset 'yes-or-no-p 'y-or-n-p)

(defun smarter-move-beginning-of-line (arg)
    "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
    (interactive "^p")
    (setq arg (or arg 1))

    ;; Move lines first
    (when (/= arg 1)
      (let ((line-move-visual nil))
	(forward-line (1- arg))))

    (let ((orig-point (point)))
      (back-to-indentation)
      (when (= orig-point (point))
	(move-beginning-of-line 1))))



;; NOTES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; https://blog.fugue.co/2015-11-11-guide-to-emacs.html
;;   above link to use Dropbox w emacs

;; Show unfinished keystrokes early.
(setq echo-keystrokes 0.1)

(toggle-scroll-bar -1)
(autoload 'hexl-find-file "hexl"
  "Edit file FILENAME in hexl-mode." t)
(define-key global-map "\C-c\C-h" 'hexl-find-file)

(defun serial-term-left-usb ()
  "Open up a serial term for left handed usb at 115200 baud rate."
  (interactive)
  (serial-term "/dev/tty.usbserial-AH03F33K" 115200))


; http://stackoverflow.com/questions/17136216/emacs-shortcut-to-move-cursor-to-column-adding-spaces-if-needed
(defun go-to-column (column)
  "Go to COLUMN, adding spaces if need be."
  (interactive "nColumn: ")
  (move-to-column column t))

;; (setf initial-buffer-choice (lambda () (dired "~/")))

(defun view-whole-image ()
  "View whole image in frame."
  (interactive)
  (org-babel-open-src-block-result nil)
  (image-mode-fit-frame nil t)
  (image-toggle-animation))

(electric-pair-mode 1)

;;________BACKUP_AND_VERSION_CONTROL________________________
;; set backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; prevent "trimming" of old backups
(setq delete-old-versions -1)

;; enable version control!
(setq version-control t)

;; 
(setq vc-make-backup-files t)

;; 
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;;________END_BACKUP_AND_VERSION_CONTROL____________________


;; nice !
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))




;; http://pages.sachachua.com/.emacs.d/Sacha.html
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
    (if mark-active (list (region-beginning) (region-end))
      (list (line-beginning-position)
        (line-beginning-position 2)))))

; ignore case when searching
(setq case-fold-search t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://ergoemacs.org/emacs/elisp_converting_hex_decimal.htmlx
(defun hex-to-dec ()
  "Prints the decimal value of a hexadecimal string under cursor.
Samples of valid input:

  ffff
  0xffff
  #xffff
  FFFF
  0xFFFF
  #xFFFF

Test cases
  64*0xc8+#x12c 190*0x1f4+#x258
  100 200 300   400 500 600"
  (interactive )

  (let (inputStr tempStr p1 p2 )
    (save-excursion
      (search-backward-regexp "[^0-9A-Fa-fx#]" nil t)
      (forward-char)
      (setq p1 (point) )
      (search-forward-regexp "[^0-9A-Fa-fx#]" nil t)
      (backward-char)
      (setq p2 (point) ) )

    (setq inputStr (buffer-substring-no-properties p1 p2) )

    (let ((case-fold-search nil) )
      (setq tempStr (replace-regexp-in-string "^0x" "" inputStr )) ; C, Perl, …
      (setq tempStr (replace-regexp-in-string "^#x" "" tempStr )) ; elisp …
      (setq tempStr (replace-regexp-in-string "^#" "" tempStr ))  ; CSS …
      )

    (message "Hex %s is %d" tempStr (string-to-number tempStr 16 ) )
    ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;reload setup everytime emacs opens
;(desktop-save-mode 1)

;midnight mode purges buffers which haven't been displayed in 3 days
(require 'midnight)
(setq midnight-mode 't)


(defun packages-other-frame ()
  "List packages in a new frame."
  (interactive)
  (make-frame)
  (make-directory "/Users/elliottkrome/.emacs.d/elpa/archives/melpa" t)
  (make-directory "/Users/elliottkrome/.emacs.d/elpa/archives/gnu" t)
  (list-packages nil))


(defun shell-other-window ()
"Open a `shell' in a new window."
(interactive)
(let ((buf (shell)))
  (switch-to-buffer (other-buffer buf))
  (switch-to-buffer-other-window buf)))


(defun shell-other-frame ()
  "Change me!"
  (interactive)
  (make-frame)
  (shell nil)
  (kmacro-end-or-call-macro nil))


(defun agenda-new-frame ()
  "Make agenda in new frame."
  (interactive)
  (make-frame)
  (org-agenda)
  (delete-other-windows))

