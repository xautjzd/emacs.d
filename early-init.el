;;; early-init.el --- early-init config

;; Copyright (C) 2022  Zhengdong 
;; Author: Zhengdong Jiang <xautjzd@gmail.com>
;; Version: 0.0.1
;; Created: 25 May 2022

;;; Commentary:

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

;;
;; Emacs 28 will automatically display the warning buffer in certain
;; circumstances. I found this to be iritating for a few common areas
;; where warnings would occur, not errors. Therefore, let's disable
;; the automatic display of the warning buffer for a few warning
;; types.
;;

(if (string-greaterp emacs-version "28.0.0")
    (setq  warning-suppress-types '((comp) (auto-save))))

;;
;; A good resource to read is https://www.emacswiki.org/emacs/OptimizingEmacsStartup.
;; This will not only explain in more depth the below settings but also why
;; some of these settings are important.
;;

;; Disable garbage collection
(setq gc-cons-threshold most-positive-fixnum)

;; Turn garbage collection back on once Emacs has started
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))

;; Report startup time
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %0.2f with %d garbage collections."
                     (float-time (time-subtract after-init-time before-init-time))
                     gcs-done)))

;; Maximize frame on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;; early-init.el ends here
