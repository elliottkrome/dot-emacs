
(autoload 'hexl-find-file "hexl"
  "Edit file FILENAME in hexl-mode." t)


(defun serial-term-left-usb ()
  "Open up a serial term for left handed usb at 115200 baud rate."
  (interactive)
  (serial-term "/dev/tty.usbserial-AH03F33K" 115200))


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




;; not working
(defun  image-new-frame-fitted  ()
  "View image in new frame."
  (interactive)
  (make-frame)
  (org-babel-open-src-block-result)
  (delete-other-windows)
  (image-mode-fit-frame))


(defun view-whole-image ()
  "View whole image in frame."
  (interactive)
  (org-babel-open-src-block-result nil)
  (image-mode-fit-frame nil t)
  (image-toggle-animation))
