(set-background-color "#313632")

;;------------------------------------------------------------------------------
;;  use-package fresh install
;;------------------------------------------------------------------------------
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap 'use-package'
(eval-after-load 'gnutls
  '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)

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
  (defun go-save-hook ()
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save))
  (add-hook 'go-mode-hook 'go-save-hook))
(use-package autopair
	:config
	(defun turn-on-autopair-mode () (autopair-mode 1)))
(use-package yaml-mode)
(use-package toml-mode)
(use-package haskell-mode)
(use-package terraform-mode
	:config
	(custom-set-variables '(terraform-indent-level 2)))
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
 '(minimap-automatically-delete-window nil)
 '(minimap-dedicated-window nil)
 '(minimap-hide-scroll-bar t)
 '(minimap-minimum-width 26)
 '(minimap-mode t)
 '(minimap-window-location (quote right))
 '(package-selected-packages
	 (quote
		(minimap yasnippet lsp-treemacs helm-lsp company-lsp flycheck-rust flycheck-inline flycheck lsp-mode idomenu rust-mode)))
 '(terraform-indent-level 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-active-region-background ((t (:background "#666666")))))
  (load-theme 'moe-dark t)

;; lsp things
(use-package lsp-mode
  :config (add-hook 'prog-mode-hook 'lsp)
  :commands lsp)
(use-package flycheck
  :config (global-flycheck-mode))
(use-package flycheck-inline
  :config
  (with-eval-after-load 'flycheck
    (add-hook 'flycheck-mode-hook #'flycheck-inline-mode)))
(use-package flycheck-rust
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))
;; (use-package lsp-ui
;;   :hook ((lsp-mode . lsp-ui-mode))
;;   :commands lsp-ui-mode)
(use-package company-lsp
  :commands company-lsp)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
(use-package yasnippet)
;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(use-package minimap)


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
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
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
