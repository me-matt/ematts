(setq inhibit-startup-message t)

(scroll-bar-mode -1)      ; Disable visual scrollbar
(tool-bar-mode -1)        ; Disable the toolbar
(tooltip-mode -1)         ; Disable tooltips
(set-fringe-mode 10)      ; Give some breathing room

(menu-bar-mode -1)        ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

(set-face-attribute 'default nil :font "Monaco" :height 150)

(load-theme 'wombat)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialise package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialise use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package counsel)

(use-package swiper)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 15))
(setq doom-modeline-time-icon t)
(setq doom-modeline-time t)
(setq doom-modeline-enable-word-count 1)
(setq doom-modeline-indent-info 1)
(setq doom-modeline-github 1)

(use-package all-the-icons)
