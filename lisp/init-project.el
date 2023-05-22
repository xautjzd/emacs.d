;;; init-project.el --- Project management configure.

;;; Commentary:

;;; Code:

(use-package diminish
  :ensure t)

;; search within project: S-p s r
(use-package rg
  :ensure t
  :init
  (rg-enable-default-bindings))
;; (rg-enable-menu)

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

(use-package treemacs-magit
  :ensure t
  :after (treemacs magit))

(use-package treemacs-all-the-icons
  :ensure t
  :after (treemacs))

(use-package dashboard
  :ensure t
  :after all-the-icons
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-projects-backend "projectile")
  (setq dashboard-icon-type 'all-the-icons)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-footer nil)
  (dashboard-modify-heading-icons '((projects . "star")))
  (setq dashboard-items '((projects . 20)
			  (recents . 10)
			  (agenda . 2))))



(provide 'init-project)
;;; init-project.el ends here
