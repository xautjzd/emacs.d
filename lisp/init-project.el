;;; init-project.el --- Project management configure.

;;; Commentary:

;;; Code:

(use-package magit
  :ensure t)

;; find file in project: s-p-f
(use-package projectile
  :ensure t
  :diminish
  :init
  (projectile-mode 1)
  :bind-keymap
  ("s-p" . projectile-command-map))

;; Discover projects on startup
;; (setq projectile-project-search-path '("~/projects/" "~/work/" ("~/github" . 1)))

(use-package diminish
  :ensure t)

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
  :ensure t
  :bind (([f8] . treemacs)))

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile))

;; search within project: S-p s r
(use-package rg
  :ensure t
  :init
  (rg-enable-default-bindings))
;; (rg-enable-menu)

(use-package dashboard
  :ensure t
  :after nerd-icons
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-display-icons-p t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-set-footer nil)
  ;;  (dashboard-modify-heading-icons '((projects . "star")))
  (setq dashboard-items '((projects . 20)
			  (recents . 10)
			  (agenda . 2))))

(provide 'init-project)
;;; init-project.el ends here
