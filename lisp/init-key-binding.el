;;; init-key-binding.el --- global key binding configure.

;;; Commentary:

;;; Code:

(global-set-key (kbd "M-g") 'goto-line)

;; Magit
(global-set-key (kbd "C-x c") 'magit-clone)
(global-set-key (kbd "C-x g") 'magit)

;; Translate
(global-set-key (kbd "C-c t") #'gts-do-translate)

;; Jump to word quickly
(global-set-key (kbd "C-c g") 'avy-goto-char-timer)

(global-set-key (kbd "C-x t k") 'tab-close)     ; Close the current tab
(global-set-key (kbd "C-x t r") 'tab-rename)    ; Rename the current tab
(global-set-key (kbd "C-x t p") 'tab-previous)  ; Switch to the previous tab
(global-set-key (kbd "C-x t n") 'tab-next)      ; Switch to the next tab

;; (global-unset-key (kbd "s-l"))

(provide 'init-key-binding)
;;; init-key-binding.el ends here
