;;; init-key-binding.el --- global key binding configure.

;;; Commentary:

;;; Code:

(global-set-key (kbd "M-g") 'goto-line)

;; Magit
(global-set-key (kbd "C-x c") 'magit-clone)

;; Translate
(global-set-key (kbd "C-c t") #'gts-do-translate)

;; (global-unset-key (kbd "s-l"))

(provide 'init-key-binding)
;;; init-key-binding.el ends here
