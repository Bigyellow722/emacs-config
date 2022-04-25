;;; init-c-mode.el --- set for c mode
;;; Commentary:
;;; Code:

;;; configure for gtags
(defun gtags-config ()
  (progn
    (add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))
    (add-to-list 'load-path "/home/wqy/global-6.6.4")
    (autoload 'gtags-mode "gtags" "" t)
    (setq gtags-suggested-key-mapping t)))

;;; configure for cscope
(defun cscope-config ()
  (require 'xcscope))
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

;;; configure for gtags
;;(add-hook 'c-mode-hook 'counsel-gtags-mode)
;;(add-hook 'c++-mode-hook 'counsel-gtags-mode)

;;(with-eval-after-load 'counsel-gtags
;;  (define-key counsel-gtags-mode-map (kbd "M-t") 'counsel-gtags-find-definition)
;;  (define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
;;  (define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
;;  (define-key counsel-gtags-mode-map (kbd "M-]") 'counsel-gtags-go-backward)
;;  (define-key counsel-gtags-mode-map (kbd "M-[") 'counsel-gtags-go-forward)
;;  (define-key counsel-gtags-mode-map (kbd "M-p") 'counsel-gtags-find-file))


(provide 'init-c-mode)
;;; init-c-mode.el ends here
