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
  (add-hook 'org-mode-hook (lambda () (
				       org-bullets-mode 1)))
  (setq org-bullets-bullet-list '("►" "▸" "•" "★" "◇" "◇" "◇" "◇")))

(setq org-log-done t)
(add-hook 'org-mode-hook
	  (lambda () (electric-pair-mode -1)))

(setq org-directory "~/org/")
;; (setq org-default-notes-file "~/org/notes.org")
;; (setq org-footnote-section "Notes")

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
