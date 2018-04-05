(use-package elfeed
  :ensure   t
  :commands elfeed)

(setq elfeed-feeds
      '("http://www.howardism.org/index.xml"     ;; My Blog
        "http://planet.emacsen.org/atom.xml"     ;; Emacs RSS
        "http://sachachua.com/blog/category/emacs-news/feed"
        "http://endlessparentheses.com/atom.xml" ;; Emacs Blog
        "http://www.masteringemacs.org/feed/"    ;; Emacs Blog
        "http://emacs-fu.blogspot.com/feeds/posts/default"
        "http://emacsredux.com/atom.xml"         ;; Emacs Blog
        "http://www.lunaryorn.com/feed.atom"     ;; Emacs Blog
        "http://emacshorrors.com/feed.atom"
        "http://swannodette.github.com/atom.xml" ;; David Nolen, duh.
        "http://batsov.com/atom.xml"             ;; Bozhidar Batsov

        "https://apod.nasa.gov/apod.rss"         ;; Nasa's Picture of the Day
        "http://twogreenleaves.org/index.php?feed=rss"

        "https://medium.com/feed/@hlship/"       ;; Programming
        "http://gigasquidsoftware.com/atom.xml"  ;; Clojure
        "http://blog.fogus.me/feed/"      ;; Programming
        "http://steve-yegge.blogspot.com/atom.xml"
        "http://www.rkn.io/feed.xml"))    ;; Programming
