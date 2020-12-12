
;; javascript
(with-eval-after-load 'js2-mode
  (require 'company-tern)
  (add-to-list 'company-backends 'company-tern)
  (add-hook 'js2-mode-hook 'tern-mode)
  ;; 激活javascript语法检查,需要安装eslint
  ;; (add-hook 'js2-mode-hook 'flycheck-mode)
  )

(provide 'init-javascript)
