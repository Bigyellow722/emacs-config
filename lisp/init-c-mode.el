;;; init-c-mode.el --- set for c mode
;;; Commentary:
;;; Code:

;;; configure for indent end
(setq c-default-style
	'((java-mode . "java")
	  (awk-mode . "awk")
	  (c-mode . "linux")
	  (other . "gnu")))

(if (> emacs-major-version 28)
    (when (treesit-available-p)
      (progn
	(require 'treesit)
	(add-to-list 'major-mode-remap-alist
		     '(c-mode . c-ts-mode))
	(add-to-list 'auto-mode-alist '("\\.h\\'" . c-ts-mode)))))

;;; configure for gtags
(defvar ggtags-auto-enable nil
  "Whether ggtags-mode is enabled in 'c-mode'.")

(defun gtags-config ()
  (progn
    (add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))
    (add-to-list 'load-path "/usr/local/bin")
    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'c-ts-mode 'c++-ts-mode)
              (ggtags-mode 1))
    ))

(defun ggtags-mode-disable-for-all-c-files ()
  "Disable ggtags-mode for all opened c files."
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (derived-mode-p 'c-ts-mode)
	(ggtags-mode -1)))))

(defun ggtags-mode-trigger ()
  "Trigger ggtags-mode automatically."
  (interactive)
  (if ggtags-auto-enable
      (progn
	(remove-hook 'c-ts-mode-hook #'gtags-config)
	(ggtags-mode-disable-for-all-c-files)
	(setq ggtags-auto-enable nil)
	(message "ggtags-auto-enable is disable"))
    (progn
      (ggtags-mode 1)
      (add-hook 'c-ts-mode-hook #'gtags-config)
      (setq ggtags-auto-enable t)
      (message "ggtags-auto-enable is enable"))))


;;; configure for cscope
(defun cscope-config ()
  (progn
    (add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp/thirdparty/xcscope")))
    (add-to-list 'load-path "/usr/local/bin")
    (require 'xcscope)
    (cscope-setup)
    (setq cscope-do-not-update-database t)
    ;; (setq cscope-program "gtags-cscope")
    ))

;;; configure for my c mode
(defun my-c-mode-hook ()
  ;;(gtags-config)
  (semantic-mode 1)
  (setq c-ts-mode-indent-style 'linux)
  ;;(cscope-config)
  )
;;; (add-hook 'c-mode-common-hook 'my-c-mode-hook)
(if (> emacs-major-version 28)
    (if (treesit-available-p)
        (add-hook 'c-ts-mode-hook #'my-c-mode-hook)
        (add-hook 'c-mode-common-hook 'my-c-mode-hook))
    (add-hook 'c-mode-common-hook 'my-c-mode-hook))
(provide 'init-c-mode)
;;; init-c-mode.el ends here
