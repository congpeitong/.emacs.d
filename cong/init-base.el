;;设置标题栏
(setq frame-title-format "GNU Emacs")
;;设置缓冲区显示内容
(setq-default
 initial-scratch-message (concat ";; Happy hacking, Gnu emacs :)\n\n")
;; line-spacing 0.1
 truncate-lines t
 word-wrap t)

;;设置环境编码
(set-language-environment "UTF-8")
;;显示列号
(setq column-number-mode t)
;;状态栏显示行列消息
(column-number-mode t)
;;当前行高亮
(global-hl-line-mode 1)
;;不显示工具栏
(tool-bar-mode 0)
;;不显示菜单栏
(menu-bar-mode 0)
;;不显示滚动条
(scroll-bar-mode 0)
;;去掉emacs响铃的声音
(setq ring-bell-function 'ignore)
;;关闭启动画面
(setq inhibit-startup-message t)
;;取消自动备份
(setq make-backup-files nil)
;;不生成临时文件
(setq-default make-backup-files nil)
;;只渲染当前屏幕的语法高亮，加快显示速度
(setq lazy-lock-defer-on-scrolling t) 
(setq font-lock-maximum-decoration t)
;;将错误信息显示在回显区
;;(condition-case err
 ;;   (progn
   ;;   (require 'xxx))
  ;;(error
  ;; (message "Can't load xxx-mode %s" (cdr err))))
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))    ;;Emacs启动自动最大化
;;(setq-default cursor-type 'bar)                  ;;设置光标样式
(set-cursor-color "#ffffff")                   ;;设置光标的颜色


;;=======================================================================
;;回显区
;;=======================================================================
;;闪屏报警
(setq visible-bell t)
;;使用y or n提问
(fset 'yes-or-no-p 'y-or-n-p)
(setq suggest-key-bindings -1)   ;;默认？
;;=========================================================================


;;===============================================================
;缓冲区
;==================================================================
;;设置删除记录
(setq kell-ring-max 200)
;;以空行结束
(setq require-final-newline t)
;;开启语法高亮
(global-font-lock-mode 1)
;;高亮显示区域选择
(transient-mark-mode t)
;页面平滑滚动，scroll-margin 3 靠近屏幕边沿3行开始滚动，正好可以看到上下文
(setq scroll-margin 3 scroll-consrvatively 10000)
;;高亮显示成对括号 成彩色
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(use-package rainbow-delimiters
  :defer 1
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
;;粘贴于光标处，而不是鼠标指针处
(setq mouse-yank-at-point t)



(provide 'init-base)
