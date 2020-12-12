;;========================================================================================
;;                                  配置web开发IDE环境
;;========================================================================================
;; 打开.html文件的时候,自动启用web-mode major mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; 打开.css文件的时候,自动启用css-mode major mode
(add-to-list 'auto-mode-alist '("\\.css?\\'" . css-mode))
;; 打开.js文件的时候,自动启用js2-mode major mode
(add-to-list 'auto-mode-alist '("\\.js?\\'" . js2-mode))
;; 配置缩进风格为4个空格
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)
;;emmet快速生成HTML代码的插件,例如输入div>ul>li*3 按C-j就可以快速生成html代码
;;Github: https://github.com/smihica/emmet-mode 有详细的用法
(require 'emmet-mode)
(setq emmet-move-cursor-between-quotes t) ;; 如果您希望在展开后将光标定位在第一个空引号之间
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)









(provide 'init-web)
