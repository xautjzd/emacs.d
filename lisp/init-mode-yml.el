;;; init-mode-yml.el --- yaml mode configure.

;;; Commentary:

;;; Code:

(use-package yaml-mode
  :ensure t
  :mode (("\\.yml\\'" . yaml-mode)))

(provide 'init-mode-yml)
;;; init-mode-yml.el ends here
