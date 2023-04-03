;;; init-c-mode.el --- set for c mode
;;; Commentary:
;;; Code:

;;; configure for indent end
(setq c-default-style
	'((java-mode . "java")
	  (awk-mode . "awk")
	  (c-mode . "linux")
	  (other . "gnu")))

(when (treesit-available-p)
  (progn
    (require 'treesit)
    (add-to-list 'major-mode-remap-alist
		 '(c-mode . c-ts-mode))))

;;; configure for gtags
(defun gtags-config ()
  (progn
    (add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))
    (add-to-list 'load-path "/usr/local/bin")
    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'c-ts-mode 'c++-ts-mode)
              (ggtags-mode 1))
    ))


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
  (gtags-config)
  (semantic-mode 1)
  (setq c-ts-mode-indent-style 'linux)
  ;;(cscope-config)
  )
;;; (add-hook 'c-mode-common-hook 'my-c-mode-hook)
(if (treesit-available-p)
    (add-hook 'c-ts-mode-hook #'my-c-mode-hook)
  (add-hook 'c-mode-common-hook 'my-c-mode-hook))

(provide 'init-c-mode)
;;; init-c-mode.el ends here
