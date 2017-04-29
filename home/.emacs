;; Get rid of clutter
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Visual line mode everywhere
(global-visual-line-mode 1)

;; Stop leaving backup files everywhere (or at all)
(setq make-backup-files nil)

;; Set default font to Ubuntu-Mono
(add-to-list 'default-frame-alist '(font . "ubuntumono"))

;; Increase the font size for my poor eyes
(set-face-attribute 'default nil :height 125)

;; Command to set font for a frame (for posterity)
;(set-frame-font "ubuntumono")

;; Add package archives
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("org" . "https://orgmode.org/elpa/") t)

;; Set my theme (to dracula)
(custom-set-variables
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "bb749a38c5cb7d13b60fa7fc40db7eced3d00aa93654d150b9627cabd2d9b361" default))))
