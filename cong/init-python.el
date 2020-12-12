;;配置python开发环境
;;需要安装的一些依赖包
;;pip install rope
;;pip install jedi
;;pip install flake8   用来检查一些语法错误
;;pip install importmagic   用来自动引入需要的包
;;pip install autopep8     用来检查PEP8规范
;;pip install yapf    用来格式化代码


;; elpy---主角
(require 'elpy)
(elpy-enable)
(setq elpy-rpc-python-command "python")  ;;python3
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")


;; 关闭flymake，使用flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules(delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))



(provide 'init-python)
