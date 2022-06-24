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
;; Disable specified modes
(mapc
 (lambda (mode)
   (when (fboundp mode)
     (funcall mode 0)))
 '(menu-bar-mode tool-bar-mode scroll-bar-mode))

;; Maximize emacs on startup
(toggle-frame-fullscreen)

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
(setq column-number-mode t)

;; -----------------
;; Basic Setup
;; -----------------

(eval-when-compile
  (require 'use-package))

(setq user-full-name "Jiang zhengdong")
(setq user-mail-address "xautjzd@gmail.com")

(prefer-coding-system 'utf-8)
(set-language-environment "utf-8")

;; Set custom file to ~/.emacs.d/custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Ask y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Stop create backup files(~)
(setq make-backup-files nil)
;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))

;; Disable lockfiles, format: .#
(setq create-lockfiles nil)
; (setq lock-file-name-transforms
;       `((".*" ,temporary-file-directory t)))

;; Auto save file, format: #xx#
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Highlight current line
(global-hl-line-mode 1)

(setq sh-set-shell "zsh")

;; Select help window for viewing when using C-h k
(setq-default help-window-select t)

;; Set eww default search engine to Google
(setq eww-search-prefix "https://www.google.com/?q=")

;; Auto insert mode
(auto-insert-mode t)  ;;; Enable global auto insert mode
(setq auto-insert-directory "~/.emacs.d/auto-insert-templates/")
;;(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
(define-auto-insert "\\.el" "emacs-lisp-template.el")

(electric-pair-mode 1)
(add-hook 'org-mode-hook (lambda ()
           (setq-local electric-pair-inhibit-predicate
                   `(lambda (c)
                      (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))

(show-paren-mode 1)

(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; --------------------
;; Packages
;;---------------------

(use-package diminish
  :ensure t)

(use-package spacemacs-theme
  :ensure t
  :defer t
  :init (load-theme 'spacemacs-dark t))

;; search within project: S-p s r
(use-package rg
  :ensure t)
;; Enable rg default key bindings(default: C-c s r)
(rg-enable-menu)

;; find file in project: s-p-f
(use-package projectile
  :ensure t
  :diminish
  :init (projectile-global-mode 1)
  :bind-keymap
  ("s-p" . projectile-command-map))

;; Discover projects on startup
;; (setq projectile-project-search-path '("~/projects/" "~/work/" ("~/github" . 1)))

;; integration with projectile, find files in project more quickly, S-p f
(use-package ivy
  :ensure t
  :diminish
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(use-package treemacs
  :bind (([f8] . treemacs))
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package magit
  :ensure t)

(use-package evil
  :ensure t
  :init
  (evil-mode 1))

(use-package flycheck
  :ensure t
  :diminish
  :init
  (global-flycheck-mode 1))

(use-package flycheck-rust
  :ensure t
  :diminish
  :hook
  (flycheck-mode . flycheck-rust-setup))

(if (eq system-type 'darwin)
    (use-package exec-path-from-shell
      :ensure t
      :config
      (exec-path-from-shell-initialize)))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package which-key
  :ensure t
  :diminish
  :config
  (setq which-key-side-window-location 'right)
  (setq which-key-show-early-on-C-h t)
  (setq which-key-side-window-max-width 0.4)
  (which-key-mode))

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
  :hook
  ;; Please install clang lsp server manually, eg: brew install llvm
  (c-mode . lsp)
  (c++-mode . lsp)
  (js-mode . lsp)
  :config
  (setq lsp-enable-file-watchers nil))

(with-eval-after-load 'js
  (define-key js-mode-map (kbd "M-.") nil))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; go mode
(use-package go-mode
  :ensure t
  :config
  (setq gofmt-command "goimports")
  (setq tab-width 4)
  (setq indent-tabs-mode 1)
  :hook
  (go-mode . lsp-deferred)
  (before-save . gofmt-before-save))

;; rust mode
(use-package rust-mode
  :ensure t
  :hook
  (rust-mode . lsp-deferred)
  :config
  (setq rust-format-on-save t)
  (setq indent-tabs-mode nil))

;; lsp python
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package lsp-java
  :hook
  (java-mode . #'lsp)
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
  :diminish yas-minor-mode
  :init
  (yas-global-mode 1))
  
;; snippet collections
(use-package yasnippet-snippets
  :ensure t)

(use-package yafolding
  :ensure t)

(use-package org-present
  :ensure t)

(use-package org-tree-slide
  :ensure t)

;; ------------------
;; Bindings
;; -----------------

(global-set-key (kbd "M-g") 'goto-line)
; (global-set-key (kbd "C-x m") 'set-mark-command)
; (global-set-key (kbd "C-c t") 'google-translate-smooth-translate)

;; Org-mode key binding
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
