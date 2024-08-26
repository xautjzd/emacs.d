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
  (global-company-mode t)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;;(add-to-list 'load-path "~/.emacs.d/codeium.el")

;; code AI
(use-package codeium
  :init
  (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
  :config
  ;; get codeium status in the modeline
  (setq codeium-mode-line-enable
        (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
  (add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t))

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

(setq-default js-indent-level 2)

(use-package format-all
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'format-all-mode)
  (add-hook 'format-all-mode-hook 'format-all-ensure-formatter))

(add-hook 'prog-mode-hook 'hs-minor-mode)

(provide 'init-language)
;;; init-language.el ends here
