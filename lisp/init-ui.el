;; for theme


;;; common config
(setq common-plugins-setting ())

(defun add-plugins-for-common (code)
  (push code common-plugins-setting))


;;; only for gui mode
(setq gui-only-plugins-setting ())

(defun add-plugins-for-gui (code)
  (push code gui-only-plugins-setting))

;;; only for tui mode
(setq tui-only-plugins-setting ())

(defun add-plugins-for-tui (code)
  (push code tui-only-plugins-setting))


(defun eval-all-settings (setting)
  (dolist (elisp-code setting)
    (eval elisp-code)))

;;; add plugins
;;;; smart-mode
(add-plugins-for-common '(use-package smart-mode-line
			   :init
			   (setq sml/no-confirm-load-theme t
				 sml/theme 'respectful)
			   (sml/setup)))

;;;; fix font
(add-plugins-for-common '(use-package emacs
			   :if (display-graphic-p)
			   :config
			   (if *is-windows*
			       (progn
				 (set-face-attribute 'default nil :font "Microsoft Yahei Mono 9")
				 (dolist (charset '(kana han symbol cjk-misc bopomofo))
				   (set-fontset-font (frame-parameter nil 'font)
						     charset (font-spec :family "Microsoft Yahei Mono" :size 12))))
			     (set-face-attribute 'default nil :height 130)
			     )))

(add-plugins-for-gui '(use-package gruvbox-theme
			:init (load-theme 'gruvbox-dark-soft t)))



(defun config-for-ui ()
  (progn
    (eval-all-settings common-plugins-setting)
    (if (display-graphic-p)
      ;;; gui mode
	(eval-all-settings gui-only-plugins-setting)
      ;;; tui mode for emacsclient
      (add-hook 'after-make-frame-functions
		(lambda (new-frame)
		  (select-frame new-frame)
		  (eval-all-settings tui-only-plugins-setting))))))



(config-for-ui)



;; line number
;;(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; change cursor
(setq cursor-type 'bar)


(provide 'init-ui)
