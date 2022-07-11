(add-to-list 'load-path (expand-file-name "~/.emacs.d/config/package"))
(require 'auto-save) ;; 加载自动保存配置文件
(setq auto-save-idle 10) ;; 空闲间隔保存(默认1秒),必须定义在开启自动保存前
(auto-save-enable) ;; 开启自动保存
(setq auto-save-silent t) ;; 悄悄地保存弹框的不要
(setq auto-save-delete-trailing-whitespace t) ;;保存时自动删除行尾的空格，不想删除则可以赋值 nil
(setq auto-save-disable-predicates
      '((lambda ()
          (string-suffix-p
           "gpg"
           (file-name-extension (buffer-name)) t)))) ;; 自定义不想自动保存的文件类型，此例gpg文件时禁用自动保存模式

(provide 'init-auto-save)
