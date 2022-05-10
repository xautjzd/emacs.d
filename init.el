(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Install use-package automatic if not installed previous
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; -------------------
;;  UI
;; -------------------
(mapc
 (lambda (mode)
   (when (fboundp mode)
     (funcall mode -1)))
 '(menu-bar-mode tool-bar-mode scroll-bar-mode))

;; Maximize emacs on startup
(toggle-frame-fullscreen)

;; -----------------
;; Basic Setup
;; -----------------

(eval-when-compile
  (require 'use-package))

(setq user-full-name "Jiang zhengdong")
(setq user-mail-address "xautjzd@gmail.com")

;; Set default font
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 200
                    :weight 'normal
                    :width 'normal)

;; Don't display welcome page when startup
(setq inhibit-startup-screen t)

(global-display-line-numbers-mode)
;; Display line numbers when programming
; (add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Set custom file to ~/.emacs.d/custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Enable rg default key bindings(default: C-c s r)
(rg-enable-default-bindings)

;; Stop create backup files(~)
(setq make-backup-files nil)

(setq sh-set-shell "zsh")

;; Disable lockfiles
(setq create-lockfiles nil)

;; Select help window for viewing when using C-h k
(setq-default help-window-select t)

;; Set eww default search engine to Google
(setq eww-search-prefix "https://www.google.com/?q=")

;; --------------------
;; Packages
;;---------------------

(use-package diminish
  :ensure t)

(use-package spacemacs-theme
  :ensure t
  :defer t
  :init (load-theme 'spacemacs-light t))

;; find file in project: s-p-f
(use-package projectile
  :ensure t
  :defer t
  :diminish projectile-mode
  :init (projectile-global-mode 1)
  :bind-keymap
  ("s-p" . projectile-command-map))

(use-package treemacs
  :bind (([f8] . treemacs))
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package magit
  :ensure t)

;; (use-package fzf
;;   :bind (("C-x ," . fzf-projectile))
;;   :ensure t)
;; (use-package rg :ensure t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md$'" . gfm-mode)
         ("\\.md$'" . markdown-mode)
         ("\\.markdown$'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; LSP begin
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-enable-file-watchers nil)  
  :hook (go-mode . lsp-deferred))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; go mode
(use-package go-mode
  :ensure t
  :commands go-mode
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))

;; rust mode
(use-package rust-mode
  :ensure t
  :config
  (setq rust-format-on-save t)
  (add-hook 'rust-mode-hook #'lsp)
  (add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil))))


;; lsp python
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package lsp-java
  :hook (java-mode . #'lsp)
  :config
  (setq lsp-java-java-path (substitute-in-file-name "$JAVA_HOME/bin/java")))
;; LSP end

;; yaml highlighting
(use-package yaml-mode
  :ensure t
  :mode (("\\.yml\\'" . yaml-mode)))

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;; Optional - provides snippet support.
(use-package yasnippet
  :ensure t
  :defer t
  :if (not noninteractive)
  :diminish yas-minor-mode
  :commands (yas-global-mode yas-minor-mode)
  :hook (go-mode . yas-minor-mode))

(use-package smartparens
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'smartparens-mode))

(use-package yafolding
  :ensure t)

(use-package org-present
  :ensure t)

(use-package org-tree-slide
  :ensure t)

;; (use-package google-translate
;;   :ensure t)
;; (use-package google-translate-smooth-ui
;;   :ensure t
;;   :config
;;   (setq google-translate-translation-directions-alist
;;       '(("en" . "zh") ("zh" . "en"))))

;; ------------------
;; Bindings
;; -----------------

(global-set-key (kbd "M-g") 'goto-line)
; (global-set-key (kbd "C-x m") 'set-mark-command)
; (global-set-key (kbd "C-c t") 'google-translate-smooth-translate)
