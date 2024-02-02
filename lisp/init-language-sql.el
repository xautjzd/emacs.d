;;; init-language-sql.el --- sql configure.

;;; Commentary:

;; More info, please view the documentation of `sql-interactive-mode'  using `C-h f'

;;; Code:

;; Set default param
;; (setq sql-mysql-login-params
;;       '((user :default "mysql")
;;         (database :default "postgres")
;;         (server :default "localhost")
;;         (port :default 3306)))


;; Connect to multiple servers
;; (setq sql-connection-alist
;;       '((server1 (sql-product 'postgres)
;;                   (sql-port 5432)
;;                   (sql-server "localhost")
;;                   (sql-user "user")
;;                   (sql-password "password")
;;                   (sql-database "db1"))
;;         (server2 (sql-product 'postgres)
;;                   (sql-port 5432)
;;                   (sql-server "localhost")
;;                   (sql-user "user")
;;                   (sql-password "password")
;;                   (sql-database "db2"))))

;; (defun connect-to-database (label)
;;   "Connect to the database associated with the given `label`."
;;   (interactive)
;;   (sql-connect  label))

;; (defun server1 ()
;;   (interactive)
;;   (connect-to-database 'server1))

;; switch database source
;; (sql-set-sqli-buffer)

;; No line truncate
(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

;; Please install pgformatter first, refer: https://github.com/darold/pgFormatter
(use-package sqlformat
  :ensure t
  :config
  (setq sqlformat-command 'pgformatter)
  (setq sqlformat-args '("--keyword-case" "2" "--spaces" "2")))

(add-hook 'sql-mode-hook
	  (lambda ()
	    (local-set-key "\C-c \C-f" 'sqlformat)))

(use-package sql-completions
  :ensure t
  :config
  (define-key sql-interactive-mode-map (kbd "TAB") #'company-complete))

(provide 'init-language-sql)
;;; init-language-sql.el ends here
