;;; init-language.el --- Language configure.

;;; Commentary:

;;; Code:

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :init
  (yas-global-mode 1))

;; snippet collections
(use-package yasnippet-snippets
  :ensure t)

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;; code AI
;; (use-package codeium
;;   :ensure t
;;   :init
;;   (add-to-list 'completion-at-point-functions #'codeium-completion-at-point))

(use-package flycheck
  :ensure t
  :diminish
  :init
  (global-flycheck-mode 1))

(use-package yafolding
  :ensure t)

;; (setq-default tab-width 4)      ; Set the default tab width to 4 spaces
(setq-default indent-tabs-mode nil) ; Use spaces for indentation, not tabs
(setq-default c-basic-offset 4) ; Set the default indentation width to 4 spaces (for programming modes)

(use-package format-all
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'format-all-mode)
  (add-hook 'format-all-mode-hook 'format-all-ensure-formatter))

(provide 'init-language)
;;; init-language.el ends here
