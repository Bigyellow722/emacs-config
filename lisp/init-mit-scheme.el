;;for mit-scheme
;; Always do syntax highlighting
(global-font-lock-mode 1)

;; Also highlight parentheses
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

;; set name of scheme implementaion
(setq scheme-program-name "/usr/bin/mit-scheme")

(provide 'init-mit-scheme)
