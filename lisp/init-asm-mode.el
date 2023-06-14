(defun gtags-config ()
  (progn
    (add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))
    (add-to-list 'load-path "/usr/local/bin")
    (ggtags-mode 1)))


(defun my-asm-mode-hook ()
  (gtags-config))

(add-hook 'asm-mode-hook 'my-asm-mode-hook)

(provide 'init-asm-mode)


