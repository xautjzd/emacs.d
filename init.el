;;; init.el --- Zhengdong's Emacs configuration.

;; Copyright (C) 2022  Zhengdong 
;; Author: Zhengdong Jiang <xautjzd@gmail.com>
;; Keywords: configuration

;;; Commentary:

;;; Code:

;; custom scripts located in ~/.emacs.d/lisp/
(add-to-list 'load-path (concat user-emacs-directory "lisp"))

;; load local sinppets(~/.elisp/) that don't want to manage using vcs.
(let ((elisp-dir (expand-file-name "~/.elisp")))
  (when (file-directory-p elisp-dir)
    (add-to-list 'load-path elisp-dir)
    (dolist (file (directory-files elisp-dir t "\\.el$"))
      (load file))))

(require 'init-package)
(require 'init-ui)
(require 'init-editor)
(require 'init-git)
(require 'init-project)
(require 'init-snippet)
(require 'init-language)
(require 'init-language-rust)
(require 'init-language-emacs-lisp)
(require 'init-language-common-lisp)
(require 'init-language-lua)
(require 'init-mode-yml)
(require 'init-mode-markdown)
(require 'init-mode-org)
(require 'init-lsp)
(require 'init-key-binding)
(require 'init-misc)
(require 'init-sql)

;;; init.el ends here
(put 'upcase-region 'disabled nil)
