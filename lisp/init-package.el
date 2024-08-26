;;; init-package.el --- a simple package.Package Configuration File -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(require 'package)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;; Install use-package automatic if not installed previous
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Startup profiler
(use-package esup
  :ensure t
  :commands esup)

(provide 'init-package)
;;; init-package.el ends here
