;;; init-language-common-lisp.el --- common lisp configure.

;;; Commentary:

;;; Code:
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

(provide 'init-language-common-lisp)
;;; init-language-common-lisp.el ends here
