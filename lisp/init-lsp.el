
(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '((c-mode c++-mode c-ts-mode c++-ts-mode) . ("clangd"
										   "--header-insertion=never"
										   "--header-insertion-decorators=0")))
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'c-mode-hook 'eglot-ensure)
)


(provide 'init-lsp)
