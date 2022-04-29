;;; init-c-mode.el --- set for c mode
;;; Commentary:
;;; Code:

;;; configure for gtags
(defun gtags-config ()
  (progn
    (add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))
    (add-to-list 'load-path "/usr/local/bin")
    (autoload 'gtags-mode "gtags" "" t)
    (setq gtags-suggested-key-mapping t)))


;;; configure for cscope
(defun cscope-config ()
  (progn
    (add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp/thirdparty/xcscope")))
    (add-to-list 'load-path "/usr/local/bin")
    (require 'xcscope)
    (cscope-setup)
    (setq cscope-do-not-update-database t)
    (setq cscope-program "gtags-cscope")))

;;; configure for my c mode
(defun my-c-mode-hook ()
  (setq c-basic-offset 4
	indent-tabs-mode t
	default-tab-width 4)
  ;;(gtags-config)
  (cscope-config)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-hook)
;;; configure for indent end


(provide 'init-c-mode)
;;; init-c-mode.el ends here
