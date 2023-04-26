;;; init-language-common-lisp.el --- common lisp configure.

;;; Commentary:

;;; Code:

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl"))
  
(provide 'init-language-common-lisp)
;;; init-language-common-lisp.el ends here
