;; -*- lexical-binding: t; -*-

;;; init-c-mode.el --- set for c mode
;;; Commentary:
;;; Code:



(defgroup my-c-mode-group nil
  "Configuration only for my c mode."
  :group 'development)

(defcustom enable-ggtags nil
  "#t means that we try to enable ggtags-mode."
  :safe 'booleanp
  :type 'boolean
  :group 'my-c-mode-group)

;; (if (> emacs-major-version 28)
;;     (when (treesit-available-p)
;;       (progn
;; 	(require 'treesit)
;; 	(add-to-list 'major-mode-remap-alist
;; 		     '(c-mode . c-ts-mode)
;; 		     '(c++-mode . c++-ts-mode))
;; 	(add-to-list 'auto-mode-alist '("\\.h\\'" . c-ts-mode)
;; 		     '("\\.hpp\\'" . c++-ts-mode)))))

;;; configure for gtags
(defvar ggtags-auto-enable nil
  "Whether ggtags-mode is enabled in 'c-mode'.")

(defun gtags-config ()
  "Enable gtags if ENABLE is #t."
  (progn
    (add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))
    (add-to-list 'load-path "/usr/local/bin")
    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'c-ts-mode 'c++-ts-mode)
      (if ggtags-auto-enable
	  (ggtags-mode 1)
	(ggtags-mode 0))
    )))

(defun ggtags-mode-disable-for-all-c-files ()
  "Disable ggtags-mode for all opened c files."
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (derived-mode-p 'c-mode 'c++-mode 'c-ts-mode 'c++-ts-mode)
	(ggtags-mode -1)))))

(defun ggtags-mode-enable-for-all-c-files ()
  "Enable ggtags-mode for all opened c files."
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (derived-mode-p 'c-mode 'c++-mode 'c-ts-mode 'c++-ts-mode)
	(ggtags-mode 1)))))

(defun ggtags-mode-trigger ()
  "Trigger ggtags-mode automatically."
  (interactive)
  (if ggtags-auto-enable
      (progn
	(remove-hook 'c-mode-hook #'gtags-config)
	(remove-hook 'c++-mode-hook #'gtags-config)
	(remove-hook 'c-ts-mode-hook #'gtags-config)
	(remove-hook 'c++-ts-mode-hook #'gtags-config)
	(ggtags-mode-disable-for-all-c-files)
	(setq ggtags-auto-enable nil)
	(message "ggtags-auto-enable is disable"))
    (progn
      (add-hook 'c-mode-hook #'gtags-config)
      (add-hook 'c++-mode-hook #'gtags-config)
      (add-hook 'c-ts-mode-hook #'gtags-config)
      (add-hook 'c++-ts-mode-hook #'gtags-config)
      (ggtags-mode-enable-for-all-c-files)
      (setq ggtags-auto-enable t)
      (message "ggtags-auto-enable is enable"))))

(use-package hideshow
  :ensure nil
  :diminish hs-minor-mode
  :bind (:map prog-mode-map
         ("C-c TAB" . hs-toggle-hiding)
         ("M-+" . hs-show-all))
  :hook (prog-mode . hs-minor-mode)
  :custom
  (hs-special-modes-alist
   (mapcar 'purecopy
           '((c-mode "{" "}" "/[*/]" nil nil)
             (c++-mode "{" "}" "/[*/]" nil nil)
             (rust-mode "{" "}" "/[*/]" nil nil)))))

(defun my-c-mode-hook ()
  "Configure for my c mode."
  ;;(gtags-config)
  (semantic-mode 1)
  (setq c-indentation-style 'linux)
  )
;;; (add-hook 'c-mode-common-hook 'my-c-mode-hook)
(if (> emacs-major-version 28)
    (if (treesit-available-p)
        (add-hook 'c-ts-mode-hook #'my-c-mode-hook)
        (add-hook 'c-mode-common-hook 'my-c-mode-hook))
    (add-hook 'c-mode-common-hook 'my-c-mode-hook))
(provide 'init-c-mode)
;;; init-c-mode.el ends here
