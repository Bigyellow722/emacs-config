;; -*- lexical-binding: t; -*-
;; for theme

(use-package modus-themes)

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

;;; Theme and font – done once, but re‑applied to every frame
(defun my/setup-ui (&optional frame)
  "Apply UI settings to the given FRAME (or current if nil)."
  (interactive)
  (with-selected-frame (or frame (selected-frame))
    ;; Load theme (only if not already enabled)
    (unless (custom-theme-enabled-p 'modus-vivendi)
      (progn
	(load-theme 'modus-vivendi t)
	;; Configure the Modus Themes' appearance
	(setq modus-themes-mode-line '(accented borderless)
	      modus-themes-bold-constructs t
	      modus-themes-italic-constructs t
	      modus-themes-fringes 'subtle
	      modus-themes-tabs-accented t
	      modus-themes-paren-match '(bold intense)
	      modus-themes-prompts '(bold intense)
	      modus-themes-org-blocks 'tinted-background
	      modus-themes-scale-headings t
	      modus-themes-region '(bg-only)
	      modus-themes-headings
	      '((1 . (rainbow overline background 1.4))
		(2 . (rainbow background 1.3))
		(3 . (rainbow bold 1.2))
		(t . (semilight 1.1))))))
    ;; Default font
    (set-face-attribute 'default nil :height 200)
    ;; Optional: set fixed-pitch and variable-pitch
    ;;(set-face-attribute 'fixed-pitch nil :family "Iosevka" :height 120)
    ;; Tidy up the frame
    (tool-bar-mode -1)
    (scroll-bar-mode -1)
    ;; (menu-bar-mode -1)   ; uncomment if you want no menu bar
    ;; line number
    ;;(setq display-line-numbers-type 'relative)
    (global-display-line-numbers-mode t)
    ;; change cursor
    (setq cursor-type 'bar)
    (use-package smart-mode-line
      :init
      (setq sml/no-confirm-load-theme t
	    sml/theme 'respectful)
      (sml/setup))
    (setq-default mode-line-format
		  (append mode-line-format '(" GC: " (:eval (number-to-string gcs-done)) "s")))
    ))

;; Run it now (for the initial daemon frame or the current GUI)
(my/setup-ui)
;; Run it for every future frame (emacsclient -c)
(add-hook 'after-make-frame-functions #'my/setup-ui)


(provide 'init-ui)
