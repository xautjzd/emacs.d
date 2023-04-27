;;; init-mode-org.el --- org mode configure.

;;; Commentary:

;;; Code:

(use-package org-present
  :ensure t)

(use-package org-tree-slide
  :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(require 'org-tempo)

(add-hook 'prog-mode-hook (lambda () (electric-pair-mode 1)))

(setq org-export-default-language "zh")
(define-auto-insert "\.org" "org-template.org")

(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; C-c c to add some capture template
(setq org-capture-templates
             '(("p" "Personal Task"  entry
               (file "personal.org")
               "* TODO %?" :empty-lines 1)
			   ("w" "Work Task" entry
			   (file "work.org")
			   "* TODO %？" :empty-lines 1)))

;; Give it a timestamp when moving a todo task into a completed state.x
(setq org-log-done 'time
      ;; todo item in ~/org/ directory will be added to agenda view
      org-agenda-files (list "~/org/")
      org-refile-use-outline-path 'file
      ;; using C-c C-w keystrokes to move org head line quickly between files
      org-refile-targets '((org-agenda-files :maxlevel . 3))
      org-outline-path-complete-in-steps nil)

;; C-u C-u C-c C-t switch sequences
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(g)"  "|" "DONE(d)")
	(sequence "代办" "处理中" "|" "已完成")
	(sequence "BUG(b)" "FIXING(f)" "|" "FIXED(x)")))

;; Org-mode key binding
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)


;; C-c C-c evaluate code blocks, more refer: https://orgmode.org/manual/Evaluating-Code-Blocks.html 
(org-babel-do-load-languages
  'org-babel-load-languages
    '((emacs-lisp . t)
      (R . t)
      (shell . t)
      (C . t)
      (python . t)
      (ruby . t)
      (emacs-lisp . t)
      (latex . t)))

;; C-c C-e l p export org doc to pdf
(with-eval-after-load 'ox-latex
  ;; http://orgmode.org/worg/org-faq.html#using-xelatex-for-pdf-export
  ;; latexmk runs pdflatex/xelatex (whatever is specified) multiple times
  ;; automatically to resolve the cross-references.
  (setq org-latex-pdf-process '("latexmk -xelatex -quiet -shell-escape -f %f"))
  (add-to-list 'org-latex-classes
               '("elegantpaper"
                 "\\documentclass[lang=cn]{elegantpaper}
                 [NO-DEFAULT-PACKAGES]
                 [PACKAGES]
                 [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (setq org-latex-listings 'minted)
  (add-to-list 'org-latex-packages-alist '("" "minted")))

;; export org to md
(require 'ox-md)

(provide 'init-mode-org)
;;; init-mode-org.el ends here
