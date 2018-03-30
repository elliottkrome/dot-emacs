
(tool-bar-mode 0)                ;; no tool-bar
(scroll-bar-mode 0)              ;; no scroll-bar
(toggle-scroll-bar 0)            ;;  ||
(winner-mode 1)                  ;; make moving between frame layouts easy
(column-number-mode 1)           ;; display column number in mode line
(blink-cursor-mode 0)            ;; no blinky cursor
(show-paren-mode t)              ;; tell (message "message" format-args)e about partners
(fringe-mode '(0 . 0))           ;; 0 pixels on the left, 0 pixels on the right

(setq frame-title-format '("%b")  ;; display buffer name in title-bar
      echo-keystrokes 0.05        ;; show unfinished keystrokes early.
      visible-bell t              ;; dinging noises annoy the people around me
      scroll-conservatively 1000  ;; scroll just enough to bring point in view
      inhibit-splash-screen t)    ;; no splash screen


;; buffer-local variable, so must use `setq-default', rather then `setq'
;;
(setq-default truncate-lines t)
