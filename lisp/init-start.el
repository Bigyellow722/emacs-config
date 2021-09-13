
;; set utf-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; set gc memory
(setq gc-cons-threshold most-positive-fixnum)

;; inhibit startup screen
(setq inhibit-startup-screen t)
;; disable toolbar
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; Enable transient mark mode
(transient-mark-mode 1)


(provide 'init-start)
