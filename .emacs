(set-background-color "#313632")

;;------------------------------------------------------------------------------
;;  Packages
;;------------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package rust-mode)
(use-package go-mode
	:config
	(setq gofmt-command "goimports")
	(add-hook 'before-save-hook 'gofmt-before-save))
(use-package autopair
	:config
	(defun turn-on-autopair-mode () (autopair-mode 1)))
(use-package yaml-mode)
(use-package toml-mode)
(use-package haskell-mode)
(use-package helm
  :config
  (helm-mode 1)
  (setq helm-split-window-default-side 'other)
	(setq helm-locate-fuzzy-match t)
	(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)
  :bind
  ("M-x" . helm-M-x)
  ("C-x r b" . helm-filtered-bookmarks)
  ("C-x C-f" . helm-find-files))
(use-package helm-projectile
  :config
  (helm-projectile-on))
(use-package projectile
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (add-hook 'ruby-mode-hook 'projectile-mode)
  (add-hook 'enh-ruby-mode-hook 'projectile-mode)
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching t))
(use-package moe-theme)
  :config

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (moe-dark)))
 '(custom-safe-themes
	 (quote
		("26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" default)))
 '(package-selected-packages (quote (idomenu rust-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
  (load-theme 'moe-dark t)

;;------------------------------------------------------------------------------
;;  Backup Directory
;;------------------------------------------------------------------------------
(setq
 backup-by-copying t
 backup-directory-alist '(("." . "~/.emacs.d/backups"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;;------------------------------------------------------------------------------
;;  General
;;------------------------------------------------------------------------------
(setq inhibit-startup-screen t)
(setq column-number-mode t)

(setq-default show-trailing-whitespace t)
(setq-default tab-width 2)

;; hide menu bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; frame color
(defun color-theme-whatever ()
  "A color theme"
(color-theme-install
 '(color-theme-whatever
   ((fringe ((t (:background "#111" :foreground "#444"))))))))
(global-linum-mode t)
(setq linum-format "%3d")


(add-to-list 'default-frame-alist '(font . "monospace 14" ))
(set-face-attribute 'default t :font "monospace 14")

;; Unbind Pesky Sleep Button
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])

;; Windows Style Undo
(global-set-key [(control z)] 'undo)

;; make emacs play nicely with system clipboard
(setq x-select-enable-clipboard t)

(setq-default
 whitespace-line-column 100
 whitespace-style '(face lines-tall))
(add-hook 'prog-mode-hook #'whitespace-mode)

;; highlight parentheses
(setq show-paren-delay 0)
(show-paren-mode 1)

;; imenu settings
(global-set-key (kbd "C-c C-i") 'helm-semantic-or-imenu)
