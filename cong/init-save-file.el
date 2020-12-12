;;不生成##文件
(setq auto-save-default nil)
;;不生成～文件
(setq backup-by-copying nil)
;;加载自动保存模块
(require 'auto-save)
;;开启自动保存功能
(auto-save-enable)
;;自动保存不提示
(setq auto-save-slient t)



(provide 'init-save-file)
