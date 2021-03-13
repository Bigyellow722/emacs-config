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

;; for gtags
(use-package counsel-gtags
  :bind-keymap ("C-c t" . counsel-gtags-command-map)
  :config
  (counsel-gtags-mode 1))

(provide 'init-package)
;;; init-package.el ends here
