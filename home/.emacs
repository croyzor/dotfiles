;; Get rid of clutter
;; ____________________________________________________________________________
;; Aquamacs custom-file warning:
;; Warning: After loading this .emacs file, Aquamacs will also load
;; customizations from `custom-file' (customizations.el). Any settings there
;; will override those made here.
;; Consider moving your startup settings to the Preferences.el file, which
;; is loaded after `custom-file':
;; ~/Library/Preferences/Aquamacs Emacs/Preferences
;; _____________________________________________________________________________
(scroll-bar-mode -1)
(tool-bar-mode -1)
; (menu-bar-mode -1)

;; Visual line mode everywhere
(global-visual-line-mode 1)

;; Stop leaving backup files everywhere (or at all)
(setq make-backup-files nil)

;; Ditto for autosave files
(setq auto-save-default nil)

;; Set default font to Ubuntu-Mono
;(add-to-list 'default-frame-alist '(font . "ubuntumono"))

;; Increase the font size for my poor eyes
;(set-face-attribute 'default nil :height 125)

;; Command to set font for a frame (for posterity)
;(set-frame-font "ubuntumono")

;; Add package archives
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
;(add-to-list 'package-archives
;	     '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("org" . "https://orgmode.org/elpa/") t)

;; Set my theme (to dracula)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode 1)
 '(custom-enabled-themes '(dracula))
 '(custom-safe-themes
   '("dcb1cc804b9adca583e4e65755895ba0a66ef82d29464cf89a78b88ddac6ca53"
     "b4ba3e1bba2e303265eb3e9753215408e75e031f7c894786ad04cabef46ff94c"
     "c1284dd4c650d6d74cfaf0106b8ae42270cab6c58f78efc5b7c825b6a4580417"
     "824d07981667fd7d63488756b6d6a4036bae972d26337babf7b56df6e42f2bcd"
     "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb"
     "bb749a38c5cb7d13b60fa7fc40db7eced3d00aa93654d150b9627cabd2d9b361"
     default))
 '(flymake-gui-warnings-enabled t)
 '(gud-tooltip-echo-area t)
 '(haskell-mode-hook '(subword-mode) t)
 '(idris-interpreter-path "idris2")
 '(lsp-completion-enable nil)
 '(lsp-enable-snippet nil)
 '(lsp-lens-enable nil)
 '(lsp-ui-sideline-show-hover t)
 '(org-todo-keywords '((sequence "TODO" "IN PROGRESS" "DONE")))
 '(package-selected-packages
   '(ace-window ack anzu auctex cider clean-aindent-mode cmake-mode
                code-cells company dap-mode dot-mode dracula-theme
                dtrt-indent ecb eglot ein etags-select etags-table
                exec-path-from-shell flycheck-mypy flymd gh-md helm
                helm-gtags helm-projectile helm-swoop idris-mode iedit
                jupyter lsp-haskell lsp-ui magit magit-svn
                multiple-cursors ox-gfm ox-jira plain-org-wiki pomidor
                projectile rainbow-delimiters realgud realgud-lldb
                rust-mode rust-playground rustic sr-speedbar
                typescript-mode undo-tree use-package
                volatile-highlights ws-butler yaml-mode yasnippet
                zygospore))
 '(python-shell-interpreter "python3")
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-note ((t (:underline (:color "yellow green" :style wave))))))

(setq inhibit-startup-screen t)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (local-set-key (kbd "C-c o") 'ff-find-other-file)))

(setq-default c-basic-offset 2)
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

(setenv "PATH"
	(concat
	 "/Users/croy/.cabal/bin"
         ":"
	 (getenv "PATH")))

;(let ((coding-system-for-read 'utf-8)
;      (agda-mode-file (shell-command-to-string "agda-mode locate")))
;  (add-to-list 'load-path (file-name-directory agda-mode-file))
;  (load-file agda-mode-file)
;  )
;(add-to-list 'load-path (file-name-directory
;(shell-command-to-string "agda")

(load-file "~/.emacs.d/work-diary.el")
;(require 'org-wiki)
(setq org-wiki-location-list
      '("~/notes/diary"))
(setq org-wiki-location (car org-wiki-location-list))

(global-set-key (kbd "M-i") 'imenu)

(add-hook
 'haskell-interactive-mode-hook
 (lambda ()
   (local-set-key (kbd "C-a") 'haskell-interactive-mode-beginning)))

(add-to-list 'auto-mode-alist '("\\.lagda.md$" . agda2-mode))

; redundant now that this is a hook of prog mode?
;(add-hook 'haskell-mode-hook 'rainbow-delimiters-mode)
(add-hook 'haskell-mode-hook 'subword-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(defun transpose-windows ()
  "Transpose two windows.  If more or less than two windows are visible, error."
  (interactive)
  (unless (= 2 (count-windows))
    (error "There are not 2 windows."))
  (let* ((windows (window-list))
	 (w1 (car windows))
	 (w2 (nth 1 windows))
         (is-vertical (window-combined-p w1))
	 (w1b (window-buffer w1))
	 (w2b (window-buffer w2)))
    (delete-other-windows w1)
    (let ((new-window (if is-vertical
                          (split-window w1 '() 'right)
                        (split-window w1 '() 'below))))
      (set-window-buffer new-window w2b))))

(global-set-key (kbd "C-x %") 'transpose-windows)

(setq-default indent-tabs-mode nil)

(setq load-path
      (append load-path (list "~/.cargo/bin"
                              "~/.ghcup/bin/cabal")))

(global-set-key (kbd "M-p") 'org-pomodoro)

;; Stop fucking minimizing
(global-unset-key (kbd "C-z"))

(setq command-environment (list "PATH=$PATH:/Users/croy/.ghcup/bin"))

(setq exec-path (append exec-path '("/Users/croy/.ghcup/bin" "/Users/croy/.cargo/bin")))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(load-file "~/src/dpq-remake/dpq-mode.el")

; (add-hook 'haskell-mode-hook #'lsp)
; (add-hook 'haskell-literate-mode-hook #'lsp)
(add-to-list 'load-path "~/.bin")
(add-to-list 'exec-path "~/.bin")

(load-file "~/.emacs.d/shonkier.el")
(add-to-list 'auto-mode-alist '("\\.shonkier$" . shonkier-mode))

(unless (boundp 'aquamacs-version)
  (global-set-key (kbd "C-x b") 'helm-buffers-list))

;(add-to-list 'load-path "~/.emacs.d/idris2-mode/")
;(require 'idris2-mode)

(setq-default column-number-mode 1)
(setq ring-bell-function 'ignore)

;(defun lsp-haskell-wingman ()
;  ;; Do something with wingman
;  (interactive)
;  (let ((action (seq-find
;                 (lambda (e) (string-prefix-p "add signature
;  )
;(add-hook 'haskell-mode-hook
;          (lambda ()
;            (setq-local company-mode '())))

(load-file "~/.local/share/brat/brat-mode.el")
(add-hook 'brat-mode-hook 'subword-mode)

;(setq lsp-log-io 't)
;(add-hook 'brat-mode-hook #'lsp)

(load-file "~/.local/share/brat/lsp-brat.el")

(add-to-list 'exec-path "~/.local/bin/")
(add-to-list 'exec-path "/home/croy/.bin/")
(setenv "PATH" (concat "~/.bin:" (getenv "PATH")))

(set-fontset-font
 "fontset-default" 'unicode "Apple Color Emoji" nil 'prepend)

(require 'lsp-mode)
(add-hook 'lsp-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-l") 'lsp-restart-workspace)))

(setq org-html-validation-link nil)

(defalias 'yes-or-no-p 'y-or-n-p)

;; typos
(autoload 'typos-mode "/Users/croy/src/typos/emacs/typos.el" nil t)
(add-to-list 'auto-mode-alist '("\\.act\\'" . typos-mode))
(add-hook 'typos-mode-hook 'rainbow-delimiters-mode)

;; Bulgarian basics
(global-set-key (kbd "C-а") 'beginning-of-line)
(global-set-key (kbd "C-е") 'end-of-line)
(global-set-key (kbd "C-б") 'backward-char)
(global-set-key (kbd "C-ф") 'forward-char)
(global-set-key (kbd "M-б") 'backward-word)
(global-set-key (kbd "M-ф") 'forward-word)
(global-set-key (kbd "C-н") 'next-line)
(global-set-key (kbd "C-п") 'previous-line)
(global-set-key (kbd "C-ь C-с") 'save-buffer)
(global-set-key (kbd "C-д") 'delete-char)

(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; MLIR Stuff
(load-file "~/.emacs.d/mlir-mode.el")
(load-file "~/.emacs.d/lsp-mlir.el")
(add-hook 'mlir-mode-hook #'lsp)

(load-file "~/.emacs.d/lsp-clangd.el")
(add-hook 'cc-mode #'lsp)
(add-hook 'prog-mode-hook 'subword-mode)

(eval-after-load "org"
  '(require 'ox-md nil t))

;; Set org-export to do the most minimal thing, since I'm always doing text or markdown
(setq org-export-with-toc nil)
(setq org-export-with-author nil)
(setq org-export-with-date nil)
(setq org-export-with-timestamp nil)
(setq org-export-with-footnotes nil)
(setq org-export-with-email nil)
(setq org-export-with-creator nil)

(setq rustic-lsp-client 'eglot)

(global-unset-key (kbd "s-q"))


;; TODO: A function which sets lsp-mode's config to be more 'on-demand', like
;; agda-mode. Flymake is disabled, so the server is only sent your code when you
;; press "C-c C-l"
;(defun lsp-on-demand ()
;  (setq-local '((lsp-enable-xref 't)
;                (lsp-completion-enable '())
;                ; set everything else false
;                )))

(require 'flymake)
(add-hook 'flymake-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-f") 'flymake-goto-next-error)
            (local-set-key (kbd "C-c C-b") 'flymake-goto-previous-error)
            (local-set-key (kbd "C-c C-e") 'flymake-show-project-diagnostics)
            ))

(setq initial-buffer-choice "~/notes/diary/TODO.org")

;; (require 'dap)
;; (dap-register-debug-template
;;   "nil"
;;   (list :type "cppdbg"
;;         :request "launch"
;;         :name "Rust::Run"
;;         :MIMode "gdb"
;;         :miDebuggerPath "rust-gdb"
;;         :environment []
;;         :program "${workspaceFolder}/target/debug/hello / replace with binary"
;;         :cwd "${workspaceFolder}"
;;         :console "external"
;;         :dap-compilation "cargo build"
;;         :dap-compilation-dir "${workspaceFolder}"))

(global-set-key (kbd "M-z") ())
; I think this is getting interpreted by Mac OS instead of emacs
(global-unset-key (kbd "S-x"))
(global-unset-key (kbd "S-<delete>"))

(require 'eglot)
; (setf (alist-get 'haskell-mode eglot-server-programs) '("haskell-language-server-9.6.3" "--lsp"))
