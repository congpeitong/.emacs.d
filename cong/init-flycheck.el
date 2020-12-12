;;flycheck语法检查
;;全局开启
;;(add-hook 'after-init-hook #'global-flycheck-mode)




;;python
(add-hook 'python-mode-hook 'flycheck-mode)


;;c/c++
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
;;web
(add-hook 'web-mode 'flycheck-mode)



(provide 'init-flycheck)
