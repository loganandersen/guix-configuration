;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual. 

(use-modules (gnu packages))

(define specification-strings->manifest
  (lambda strings
    "This takes a bunch of strings of package names and creates a manifest out of it"
    (specifications->manifest strings)))

(define-syntax-rule (my-define-manifest name strings*)
  "This takes a series of strings and creates a manifest variable called name with those strings"
  (define name (specification-strings->manifest strings*)))


(define lua-manifest
  (specification-strings->manifest
   "lua"
   "emacs-lua-mode"))

(define odd-languages-manifest
  (specification-strings->manifest
   "smalltalk"
   "gnugo"
   "gprolog"
   "swi-prolog"
   "groff" ;; this is a basic document creating software
   "apl"
   "mercury"
   "my-snap" ;; this is a visual programming language.
   "emacs-feature-mode" ;; emacs for editing gherkin user stories
   ))

(define math-tools-manifest
  (specifications->manifest
   (list "maxima" ;; linear algrebra
	 "gnuplot" ;; needed to create maxima graphs
	 "gap" ;; computational group theory
	 ;; "jacal" ;; gnu symbolic manipulation, supports lambda calculus. ;; broken as of 2025-09-24 because scm won't build
	 "julia" ;; M-expression calculation language.
	 "emacs-julia-mode" ;; emacs julia
	 "emacs-julia-repl" ;; emacs julia repl package, there are
			    ;; some other ones too
	 ;; "emacs-ess"  ;; this has a julia mode, I could use it as an
	              ;; alternative.
	 ;; this comment is to keep emacs from auto indenting the above
	 ;; comment, feel free to remove when you add another package.
	 )))

(define lean-manifest
  (specification-strings->manifest
   "lean"))

(define coq-manifest
  (specifications->manifest
   (list "coq"
	 "proof-general" ;; interactive theorem provers for emacs
	 "emacs-company-coq" ;; improved support for coq in proof general
	 )))

(define general-development-tools-manifest
  (specifications->manifest
   (list "make"
         "git"
	 "vim"
	 "gcc-toolchain"
	 "gdb"
	 "poke" ;; binary editor
	 "cloc" ;; count lines of code
	 )))

(define font-manifest
  (specifications->manifest
   (list "font-adobe-source-han-sans" ;; japanese, suppsoedly the same
				      ;; as noto font
	 "unicode-emoji" ;; emoji data package (idk if needed)
	 "font-google-noto-emoji" ;; google emoji fonts
	 "font-google-noto" ;; non CJK characters (almost all of them).
         "fontconfig"
	 "ghostscript" ;; needed for some pdf stuff
	 )))

;; note that this isn't added to the list yet.
(define command-line-tools-manifest
  (specifications->manifest
   (list "recutils"
	 "file"
	 "units"
	 "neofetch"
	 "wfetch"
	 "bc"
	 "attr" ;; tools for manipulating filesystem attributes
	 "batlevel"
	 "htop"
	 ;; "python-xattr" ;; modify xattr variables ;; breaks nerd dictation
	 "pandoc"   ;; convert different files
	 "uniutils" ;; unicode lookup stuff
	 "jq"	    ;; json query tool (I use with youtube-dl mainly)
	 ;; "edirect"  ;; ask the government's NCBI database for data.
	 ;; "edirect-go-programs" ;; idk what the difference between this and above is.
	 "gcal" ;; Calendar, I kind of want the bsd calendar, but I
	 ;; think this might be able to do the same job.
;;	 "pango" ;; This is a text rendering library, I like the pango-view
	 ;; command. I ALREADY HAVE IT INSTALLED FOR SOME REASON.
	 "perl-image-exiftool" ;; view exif with exiftool command
	 "ncurses" ;; tput
	 ;; "rss-bridge" ;; make custom rss feeds
	 "termdown" ;; countdown timer for terminal
	 )))

(define x-tools-manifest
  (specifications->manifest
   (list "xset"
	 "xprop"
	 "xdotool"
	 "xdpyinfo" ;; This is used to get information about screen size
	 "xkbset" ;; this is used to set sticky keys.
	 "xmessage" ;; display dialogues
	 "xkbcomp" ;; this is used to set X keyboard maps (low level)
	 "setxkbmap" ;; high level change keymaps
	 "xinput" ;; can be used to query x11 devices
	 "xclip" ;; clipboard stuff
	 )))

(define multimedia-manifest
  (specifications->manifest
   (list "yt-dlp" 
	 ;; "gallery-dl" ;; for some reason there's a gallery dl build failure
	 "mpv"
	 "feh"
	 ;; "imgbrowse" ;; depends on gallery dl 
	 "imv" ;; igeneral purpose image viewer that can view svg and animate gifs. 
	 "ytfzf"
	 "xfig" ;; this is for drawing figures.
	 "ani-cli" ;; like ytfzf for anime (very cool).
	 "sox" ;; command line sound editor
	 ;; "snd" ;; emacs like editor for .snd file (seems very cool)
	 )))

;; For now, I only have some command line tools, This package isn't
;; part of my acutal manifest yet (TODO add it to the file expression.
(define xml-manifest
  (specification-strings->manifest
   "html-xml-utils"
   "xmlstarlet"
   "python-yq"))

(define ergonomics-manifest
  (specifications->manifest
   (list "nerd-dictation" ;; speech to text. ;; couldn't build kaldi on 2025-04-27
	 "espeak-ng" ;; text to speech
	 )))

(define desktop-app-manifest
  (specifications->manifest
   (list "pcmanfm"
	 ;; "nyxt" ;; haven't used this in a while
	 "libreoffice"
	 "texmacs-guile3" ;; texmacs is kinda like libreoffice I might want to replace liboffice with it. 
	 "mupdf"
	 "zathura" ;; this is another pdf viewer like mupdf, it might
	 ;; be a good replacement. It is extensible it seems.
	 "zathura-djvu" ;; djvu support for zathura
	 "zathura-pdf-mupdf" ;; mupdf support to zathura
	 ;; "djview" ;; read djvu files, zathura is better
	 )))

(define python-manifest
  (specifications->manifest
   (list "python"
	 "python-numpy"
	 ;;"python-numpy-documentation" ;; this one has a build failure
	 "python-pylint" ;; source code linting
	 )))

(define terminal-manifest
  (specifications->manifest
   (list "bash-completion"
	 "screen"
	 )))

(define rust-manifest
  (specification-strings->manifest
   "rust"
   "rust:cargo"
   "rust:rust-src"
   "rust:tools"
   "emacs-rustic"))

(define gnu-dev-tools-manifest
  (specifications->manifest
   (list "autoconf"
	 "automake"
	 "texinfo")))
	 
(define c-development-manifest
  (specifications->manifest
   (list "glibc"
	 "c-intro-and-ref"
	 )))

(define c-libraries-manifest
  (specification-strings->manifest
   "cairo";; c graphics library
   ))

(define emacs-manifest
  (specifications->manifest
   (list "emacs"
	 "emacs-hyperbole"
	 "emacs-magit"
	 "emacs-git-timemachine" ;; look through old git files (seems
				 ;; useful)
	 "ispell"
	 "emacs-elfeed"
	 "emacs-flymake-shellcheck"
	 "emacs-markdown-mode"
	 "emacs-synosaurus"
	 "emacs-flycheck"
	 "emacs-ed-mode"
	 "emacs-nov-el" ;; epub reading 
	 "emacs-restart-emacs" ;; this is pretty broken with the
			       ;; server. It is better to restart it
			       ;; with herd or systemd instead
	 "emacs-org-contrib" ;; I am using the org-bookmarks addon
			     ;; with this. lilypond mode also uses this I think. 
	 ;; "emacs-org-roam" ;; slipbox system stopped working on 2025-05-04, I installed it from elpa instead
	 "emacs-org-drill" ;; this is for flash cards
	 ;; "emacs-literate-elisp" ;; this can let you execute elisp
				   ;; blocks in orgmode files I think
				   ;; emacs already has this feature
	 ;; (org-babel-load-file)
	 "emacs-paredit" ;; edit lisp as AST.
	 "emacs-visual-fill-column" ;; this lets visual line wrap work
	 ;; with a fill column
	 "emacs-org-chef"
	 "emacs-undo-tree"
	 "tree-sitter" ;; This might be needed to use tree sitter modes
	 "emacs-citeproc" ;; csl citation processor
	 ;; "emacs-gptel" ;; emacs ai chatbot
	 "emacs-company" ;; completions (in buffer)
	 "emacs-helm" ;; completions
	 )))

(define manuals-manifest
  (specifications->manifest
   (list ;; "sicp" ;; package no longer exists
	 "info-reader"
	 "man-pages"
	 "man-pages-posix"
	 "man-db" ;; makes man pages visible in shells.
	 ;; "grub" ;; package no longer exists
	 "wayland:doc" ;; wayland manpages
	 )))

(define games-manifest
  (specifications->manifest
   (list "daikichi" ;; fortune replacement 
	 "my-fortunes-jkirchartz" ;; fortune data
	 "nethack"
	 "rogue"
	 "bsd-games"
	 ;; "marble-marcher" ;; laptop too laggy
	 "sgt-puzzles" ;; every puzzle starts with sgt-
	 )))

(define guile-manifest
  (specifications->manifest
   (list "guile"
	 "guile-colorized" ;; colors
	 "guile-chickadee" ;; game dev
	 "tsukundere"	   ;; visual novel dev
	 ;; "guile-gnome" ;; different guile versions
	 ;; "nyacc" ;; parser generator guile already comes with one, Idk what the difference is.
	 ;; Downloaded png and jpeg to test image transformation stuff.
	 "guile-png" 
	 "guile-jpeg"
	 "guile-homesub" ;; this is my package for tilde expansion
	 ;;This is a scheme compatibility library needed for jacal to
	 ;;work. you also need to add export
	 ;;GUILE_LOAD_PATH=/home/loga/.guix-profile/lib/slib/:$GUILE_LOAD_PATH
	 ;;to your .bashrc file for (use-modules (ice-9 slib)) to
	 ;;work. SLIB is still messed up because it asks you to do
	 ;;something that changes the filesystem, which is not allowed
	 ;;[[info:guile#SLIB installation][guile#SLIB installation]]
	 ;;[[file:~/.bashrc::Add slib to the scheme load path.]] I
	 ;;need some way to get an slibcat file in my guile/3.0 file.
	 "slib"
	 ;; cairo vector grapics library
	 "guile-cairo"
	 ;; sdl2 graphics library
	 "guile-sdl2"
	 ;; emacs stuff
	 "emacs-geiser"
	 "emacs-geiser-guile"
	 "emacs-guix"
	 "emacs-flycheck-guile"
	 )))

(define sbcl-manifest
  (specifications->manifest
   (list "sbcl"
	 "sbcl-regex"
	 "emacs-slime"
	 "sbcl-quicksearch"
	 "sbcl-slime-swank"
	 "sbcl-cl-str" ;; a string library with the replace all function.
	 "emacs-macrostep" ;; this is a dependency for emacs-slime
	)))

(define desktop-environment-manifest
  (specifications->manifest
   (list "stumpwm" 
	 "dmenu"
	 "librsvg"
	 "xdg-utils"
	 "clipmenu" ;; clipboard manager, I also have this configured
		    ;; with shepherd and stumpwm, so It is necessary
	 ;; to change those configurations If I remove this.
	 "redshift" ;; red light filter. Configured in shepherd.
	 "dunst" ;; notification daemon (IDK if this works).
	 "libnotify" ;; supplies notify-send
	 )))

(define tla+-manifest
  (specification-strings->manifest
   "tla2tools"
   "tree-sitter-tlaplus" ;;emacs I think
   ))

(define internet-manifest
  (specifications->manifest
   (list "curl"
	 "bind:utils" ;; domain name stuff (nslookup)
	 "openssh"
	 "lynx"
	 "links" ;; lightweight graphical web browser links -g
	 "kubo" ;; ipfs implementation
	 ;; "gnunet" ;; gnunet can't find peers
	 "icecat"
	 "livemarks-icecat" ;; icecat rss feed reader I think
	 "tor-client"
	 "torsocks"
	 "tor"
	 "torbrowser"
	 ;; "archivebox" ;; django build error,
	 ;; "kiwix-desktop ";; kiwix can let you browse websites offline 
	 "rclone" ;; like rsync on steroids, has mount file system over ssh
	 "netcat" ;; simple client for network stuff
	 "rsync"
	 "ungoogled-chromium"  
	 "emacs-elpher" ;; browse gemini and gopher
	 "openssl" ;; needed to generate ssl certs for gemini
	 "emacs-jabber" ;; xmpp client emacs
	 "emacs-ement" ;; matrix reader
	 "newsboat" ;; rss feed reader (emacs feed reading sucked)
	 ;; "tmate" ;; share tmux sessions
	 "i2pd" ;; Invisible internet daemon.
	 )))

(define security-manifest
  (specifications->manifest
   (list "gnupg"
	 "pinentry-tty" ;; terminal pin entry for gnupg
	 "python-diceware"
	 "password-store" ;; get passwords
	 "pass-otp" ;; otp codes for pass
	 )))

(define conversion-manifest ;; converting and editing files
  (specifications->manifest
   (list "libwebp" ;; convert webp to normal files
	 "ffmpeg" ;; convert 
	 )))


(define misc-file-format-manifest
  (specifications->manifest
   (list "pdftk" ;; pdf toolkit, edit PDFS
    )))

 (define r-devel-manifest
   (specifications->manifest
    (list "r"
	  ;; "r-learnr" ;; r tutorial
	  ;; "r-hsaur3" ;; r book programs with first chapter
	  ;; "tree-sitter-r" ;; tree sitter R grammar
	  ;; r-astsa ;; Time Series Analysis and Its  Applications: With R Examples (4th ed), by R.H.  Shumway and D.S.  Stoffer. https://doi.org/10.1007/978-3-319-52452-8' https://doi.org/10.1201/9780429273285 
	 "emacs-ess")))

(define r-statistics-manifest
  (specifications->manifest
   (list "r-rsq" ;; compute r squared
	 "r-r2glmm" ;; computer r squared for mixed models
	 "r-leiden" ;; detect communities in graph network
	 "r-lavaan" ;; Latent variable analysis
	 "r-desctools" ;; used for describing data (has gini coefficent)
	 ;; "r-pls" ;; partial least squares analysis
	 ;; "r-decon" ;; deconvolution estimation (IDK what this means but it sounds cool)
	 ;; "r-lmtest" ;; has lm ;; build error

	 )))

(define r-graph-manifest
  (specifications->manifest
   (list ;; "r-rgraphviz" ;; write graphvis stuff in R
	 "r-ggplot2" ;; make plots standard
	 "r-ggformula" ;; formula for ggplot interface
	 "r-unigd" ;; unified graphics backend
	 ;; "r-semplot" ;; structural equation modeling plots
	 `)))

;; general tools that make creating graphs easier
(define r-tools-manifest
  (specifications->manifest
   (list
    "r-tidyr"
    "r-dplyr"
    ;; "r-gdata" ;; general tools for data manipulation
;;    "r-waldo" ;; find differences between data structures
    )))

;; query stuff from internet
(define r-internet-manifest
  (specifications->manifest
   (list
    "r-rentrez"
    )))

(define forth-manifest
  (specifications->manifest
   (list "gforth")))


(define archive-manifest
  (specifications->manifest
   (list "unzip"
	 "zip"
	 "archivemount"
	 "7zip"
	 )))

(define anki-manifest
  (specifications->manifest
   (list "anki"
	 "emacs-anki-editor")))

(define java-manifest
  (specifications->manifest
   (list "openjdk"
	 "openjdk:doc" 
	 "openjdk:jdk"
	 "tree-sitter-java")))

(define shell-developement-manifest
  (specifications->manifest
   (list "shellcheck")))

(define texlive-manifest
  (specifications->manifest
   (list "texlive-base"
	 "texlive-biblatex"
	 "texlive-biber" ;; needed to make biblatex work
	 ;; 
	 "bibutils" ;; convert stuff with bib, see
		    ;; https://tex.stackexchange.com/questions/270270/convert-ris-or-nbib-or-json-to-bibtex
	
	 ;; taken from https://issues.guix.gnu.org/40558#0
	 ;; supposed to fix org not compiling latex previews
	 ;; More info at.
	 ;; /home/loga/Documents/notes/wiki/source/laptop/org/emacs/org_mode/compiling_with_latex/compiling_with_latex.org
	 "texlive-latex-preview"
	 "texlive-latex-base"
	 "texlive-latexconfig"
	 "texlive-fonts-ec"
	 "texlive-oberdiek"
	 "texlive-wrapfig"
	 "texlive-ulem"
	 "texlive-latex-capt-of"
	 "texlive-latex-hyperref"
	 "texlive-amsfonts"
	 "texlive-fontinst"
	 "texlive-metafont-base"
	 "texlive-unicode-data"
	 "texlive-pstool"
	 "texlive-cm"
	 "texlive-cm-super"
	 "texlive-latex-amscls"
	 "texlive-fonts-latex"
	 "texlive-latex-amsmath"
	 "texlive-breqn" ;; used for maxima formatting
	 

	 ;; emacs configuration 
	 "emacs-auctex"
	 "emacs-cdlatex")))

(define diagram-manifest
  (specifications->manifest
   (list "graphviz" ;; visualize graphs
	 "emacs-graphviz-dot-mode"
	 "xdot" ;; visualize graphs viewer
	 "plantuml" ;; uml diagrams
	 "emacs-plantuml-mode"
	 "plotutils" ;; plot from command line
	 )))

(define natural-language-manifest
  (specifications->manifest
   (list "dico" ;; dictionary 
	 "translate-shell"
	 "diction" ;; used for grading plaintext essays (style has flesch kincair scores)
	 "tagainijisho" ;; japanese dictionary
	 ;; "emacs-kanji" ;; display kanji stroke order in emacs (broken)
	 ;; build fail "skk-tools" ;; japanese skk tools
	 ;; "emacs-ddskk" ;; Japanese input (advanced?) I haven't tried this yet
	 ;; "r-wordspace" ;; for studying distrobutional semantic models
	 )))

;; For composing music
(define music-manifest
  (specifications->manifest
   (list ;; "extempore" ;; scheme for music
	 ;; "emacs-extempore-mode"
	 "lilypond" ;; music engraving
	 )))
(define image-editing-manifest
  (specifications->manifest
   (list "imagemagick"
	 "graphicsmagick" ;; used by pango, it is a fork of imagemagick
	 "gimp")))

;; For playing audio
(define audio-manifest
  (specifications->manifest
   (list "timidity++" ;; play midi
	 )))

(define godot-manifest ;; my graphics drivers don't suport opengl
  (specification-strings->manifest
   "godot"
   "emacs-gdscript-mode"))

;; mix is the programming language used in the art of computer science
;; book.
(define mix-manifest
  (specifications->manifest
   (list "mdk" ;; gnu mix emulator
	 )))

(define jami-manifest
  (specification-strings->manifest
   "jami"
   "gsettings-desktop-schemas" ;; jami needs a gsettings schema to
			       ;; work
   ))

(concatenate-manifests
 (list odd-languages-manifest
       general-development-tools-manifest
       font-manifest
       command-line-tools-manifest
       x-tools-manifest
       multimedia-manifest
       desktop-app-manifest
       python-manifest
       terminal-manifest
       c-development-manifest
       emacs-manifest
       manuals-manifest
       games-manifest
       guile-manifest
       sbcl-manifest
       desktop-environment-manifest
       internet-manifest
       security-manifest
       conversion-manifest
       r-devel-manifest
       r-graph-manifest
       r-tools-manifest
       forth-manifest
       archive-manifest
       anki-manifest
       java-manifest
       shell-developement-manifest
       texlive-manifest 
       math-tools-manifest
       diagram-manifest
       natural-language-manifest
       music-manifest
       image-editing-manifest
       misc-file-format-manifest
       audio-manifest
       mix-manifest
       gnu-dev-tools-manifest
       ergonomics-manifest
       rust-manifest
       coq-manifest
       ;; c-libraries-manifest ;; this usually causes collisions
       ;; jami-manifest ;; not installed
       ))
  
