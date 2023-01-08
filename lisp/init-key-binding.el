;;; init-key-binding.el --- global key binding configure.

;;; Commentary:

;;; Code:

(global-set-key (kbd "M-g") 'goto-line)

;; Magit
(global-set-key (kbd "C-x c") 'magit-clone)

;; Org-mode key binding
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; (global-unset-key (kbd "s-l"))

(provide 'init-key-binding)
;;; init-key-binding.el ends here
