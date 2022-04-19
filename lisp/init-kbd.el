
(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-=") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)

(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

(require 'imenu-list)
(global-set-key [(control f1)] 'imenu-list-minor-mode)

(provide 'init-kbd)
