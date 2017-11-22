;;; package -- summary
;;; Commentary:
;;; Code:

(require 'org)

(setq org-latex-packages-alist '(("margin=2.5cm" "geometry" nil "minted")))

;; http://pages.sachachua.com/.emacs.d/Sacha.html
(setq org-export-backends '(org latex icalendar html ascii))


;; https://emacs.stackexchange.com/questions/20839/exporting-code-blocks-to-pdf-via-latex
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted) 
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

 (setq org-latex-minted-options
       '(("frame" "lines")
	 ("linenos=true")
	 ("fontsize" "\\scriptsize")))

;; http://orgmode.org/worg/org-contrib/babel/examples/article-class.html



;; https://www.reddit.com/r/emacs/comments/6r32q4/orgmode_whats_your_html_export_look_like/
;;
(setq org-html-head "<meta http-equiv='X-UA-Compatible' content='IE=edge'><meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'><style>html{touch-action:manipulation;-webkit-text-size-adjust:100%}body{padding:0;margin:0;background:#f2f6fa;color:#3c495a;font-weight:normal;font-size:15px;font-family:'San Francisco','Roboto','Arial',sans-serif}h2,h3,h4,h5,h6{font-family:'Trebuchet MS',Verdana,sans-serif;color:#586b82;padding:0;margin:20px 0 10px 0;font-size:1.1em}h2{margin:30px 0 10px 0;font-size:1.2em}a{color:#3fa7ba;text-decoration:none}p{margin:6px 0;text-align:justify}ul,ol{margin:0;text-align:justify}ul>li>code{color:#586b82}pre{white-space:pre-wrap}#content{width:96%;max-width:1000px;margin:2% auto 6% auto;background:white;border-radius:2px;border-right:1px solid #e2e9f0;border-bottom:2px solid #e2e9f0;padding:0 115px 150px 115px;box-sizing:border-box}#postamble{display:none}h1.title{background-color:#343C44;color:#fff;margin:0 -115px;padding:60px 0;font-weight:normal;font-size:2em;border-top-left-radius:2px;border-top-right-radius:2px}@media (max-width: 1050px){#content{padding:0 70px 100px 70px}h1.title{margin:0 -70px}}@media (max-width: 800px){#content{width:100%;margin-top:0;margin-bottom:0;padding:0 4% 60px 4%}h1.title{margin:0 -5%;padding:40px 5%}}pre,.verse{box-shadow:none;background-color:#f9fbfd;border:1px solid #e2e9f0;color:#586b82;padding:10px;font-family:monospace;overflow:auto;margin:6px 0}#table-of-contents{margin-bottom:50px;margin-top:50px}#table-of-contents h2{margin-bottom:5px}#text-table-of-contents ul{padding-left:15px}#text-table-of-contents>ul{padding-left:0}#text-table-of-contents li{list-style-type:none}#text-table-of-contents a{color:#7c8ca1;font-size:0.95em;text-decoration:none}table{border-color:#586b82;font-size:0.95em}table thead{color:#586b82}table tbody tr:nth-child(even){background:#f9f9f9}table tbody tr:hover{background:#586b82!important;color:white}table .left{text-align:left}table .right{text-align:right}.todo{font-family:inherit;color:inherit}.done{color:inherit}.tag{background:initial}.tag>span{background-color:#eee;font-family:monospace;padding-left:7px;padding-right:7px;border-radius:2px;float:right;margin-left:5px}#text-table-of-contents .tag>span{float:none;margin-left:0}.timestamp{color:#7c8ca1}@media print{@page{margin-bottom:3cm;margin-top:3cm;margin-left:2cm;margin-right:2cm;font-size:10px}#content{border:none}}</style>")

(eval-after-load "ox-latex"

  ;; beamer - update the list of LaTeX classes and associated header (encoding, etc.)
  ;; and structure
  ;;
  '(add-to-list 'org-latex-classes
                `("beamer"
                  ,(concat "\\documentclass[presentation]{beamer}\n"
                           "[DEFAULT-PACKAGES]"
                           "[PACKAGES]"
                           "[EXTRA]\n")
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

(provide 'ek-org-export)
;;; ek-org-export ends here
