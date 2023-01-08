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

(provide 'init-project)
;;; init-project.el ends here
