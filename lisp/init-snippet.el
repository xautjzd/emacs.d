;;; init-snippet.el --- Code snippet configure.

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

(provide 'init-snippet)
;;; init-snippet.el ends here
