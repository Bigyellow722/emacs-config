;;; init-package.el --- setting fo package
;;; Commentary:
;;; Code:

;; restart-emacs
(use-package restart-emacs)

;; benchmark-init
(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

;; delete line
(use-package crux
  :bind (("C-S-k" . crux-smart-kill-line)
	 ("C-a" . crux-move-beginning-of-line)
	 ("C-x ," . crux-find-user-init-file)
	 ("C-c ^" . crux-top-join-line)))

;; delete space region
(use-package hungry-delete
  :bind (("C-c DEL" . hungry-delete-backward))
  :bind (("C-c d" . hungry-delete-forward)))

;; move region or line
(use-package drag-stuff
  :bind (("<M-up>" . drag-stuff-up)
	 ("<M-down>" . drag-stuff-down)))

;; ivy
(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-count-format "%d/%d "
	enable-recursive-minibuffers t
	ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

;; counsel
(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git)))

;; swiper
(use-package swiper
  :after (ivy)
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
		swiper-include-line-number-in-search t))

;; syntax check
(use-package flycheck
  :hook (after-init . global-flycheck-mode))

;;
(use-package which-key
  :defer nil
  :config (which-key-mode))

;; for switching windows
(use-package ace-window
  :bind (("M-o" . 'ace-window)))

;; for git
(use-package magit
  :ensure t)

;; for highlight-symbol
(use-package highlight-symbol
  :ensure t
  :bind (("C-<f3>" . highlight-symbol)
	 ("<f3>" . highlight-symbol-next)
	 ("S-<f3>" . highlight-symbol-prev)
	 ("M-<f3>" . highlight-symbol-query-replace)))

;; for imenu-list
(use-package imenu-list
  :ensure t
  :bind (("C-<f1>" . imenu-list-minor-mode)))

;; for ggtags
(use-package ggtags
  :ensure t)

(use-package graphviz-dot-mode
  :ensure t
  :config
  (setq graphviz-dot-indent-width 4))

(use-package geiser-guile
  :ensure t)

(use-package rg
  :init
  (rg-enable-default-bindings))

(use-package rime
  :custom
  (default-input-method "rime")
  :config
  (setq rime-user-data-dir "~/.config/fcitx/rime"))

(use-package yaml-mode)

(provide 'init-package)
;;; init-package.el ends here
