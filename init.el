(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))  ;; 设置配置文件主目录
;; 先设置背景，避免闪烁。
(add-hook 'after-init-hook #'fancy-battery-mode)
(require 'init-directory) ;; 文件目录定义

(require 'init-benchmarking) ;; 测量启动时间

(require 'init-const) ;; 常量设置

;; 启动后首页的配置
(require 'init-startup)
(require 'init-symbols)

(setq custom-file (locate-user-emacs-file "custom.el")) ;; 自定义文件

(require 'init-utils) ;; 定义的工具类

(require 'init-open-file) ;; 内置打开某些文件函数

(require 'init-site-lisp) ;; 必须在 elpa 之前，因为它可能提供 package.el

;; Call(package-initialize)
(require 'init-elpa)      ;; 用于安装所需软件包的

(require 'init-preload-local nil t) ;; 允许用户提供可选的“init-preload-local.el”

;; 加载特定功能和模式的配置
(require-package 'diminish)
(maybe-require-package 'scratch)
(require-package 'command-log-mode)

(require 'init-time) ;; 时间设置
(require 'init-utf-8) ;; utf-8编码设置
(require 'init-themes) ;; 主题设置
(require 'init-auto-save) ;; 自动保存
(require 'init-powerline) ;; 状态栏美化

(require 'init-frame-hooks)
(require 'init-xterm)

(require 'init-osx-keys) ;; 主要Mac按键配置

(require 'init-gui-frames)

(require 'init-dired) ;; 文件管理
(require 'init-isearch) ;; 搜索
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer) ;; 缓冲区管理

(require 'init-flymake) ;; 语法检查
(require 'init-eglot)

(require 'init-recentf) ;; 用于跟踪最近文件的设置
(require 'init-minibuffer) ;; 文件的提示
(require 'init-hippie-expand) ;; 文件提示扩展
(require 'init-company) ;; 语法补全
(require 'init-windows) ;; 窗口分隔/切换
(require 'init-sessions) ;; 在重新启动之间保存和恢复编辑器会话
(require 'init-mmm) ;; 多种主要模式的支持

(require 'init-editing-utils) ;; 含有命令提示功能
(require 'init-whitespace) ;; 空格

;; 版本控制
(require 'init-vc)
(require 'init-darcs)
(require 'init-git)
(require 'init-github)

(require 'init-projectile) ;; 使用 Projectile 在项目中导航

(require 'init-compile)
(require 'init-crontab)
(require 'init-textile)
(require 'init-markdown)
(require 'init-csv)
(require 'init-erlang)
(require 'init-javascript)
(require 'init-php)
(require 'init-org)
(require 'init-nxml)
(require 'init-html)
(require 'init-css)
(require 'init-haml)
(require 'init-http)
(require 'init-python)
(require 'init-haskell)
(require 'init-elm)
(require 'init-purescript)
(require 'init-ruby)
(require 'init-rails)
(require 'init-sql)
(require 'init-ocaml)
(require 'init-j)
(require 'init-nim)
(require 'init-rust)
(require 'init-toml)
(require 'init-yaml)
(require 'init-docker)
(require 'init-terraform)
(require 'init-nix)
(maybe-require-package 'nginx-mode)


(require 'init-paredit)
(require 'init-lisp)
(require 'init-slime)
(require 'init-clojure)
(require 'init-clojure-cider)
(require 'init-common-lisp)

;; 语法检查开启则加载init-spelling
(when *spell-check-support-enabled*
  (require 'init-spelling))

(require 'init-misc)

(require 'init-folding)
(require 'init-dash)

;;(require 'init-twitter)
;; (require 'init-mu)
(require 'init-ledger)
;; 不需要任何配置的额外包

(require-package 'sudo-edit)
(require-package 'gnuplot)
(require-package 'lua-mode)
(require-package 'htmlize)

(when *is-a-mac*
  (require-package 'osx-location))
(maybe-require-package 'dotenv-mode)
(maybe-require-package 'shfmt)

(when (maybe-require-package 'uptimes)
  (setq-default uptimes-keep-count 200)
  (add-hook 'after-init-hook (lambda () (require 'uptimes))))

(when (fboundp 'global-eldoc-mode)
(add-hook 'after-init-hook 'global-eldoc-mode))

(require 'init-direnv)

;; 允许从 emacsclient 访问
(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
              (server-start))))


;; 通过交互式“自定义”界面配置的变量
(when (file-exists-p custom-file)
  (load custom-file))

;; Locales (setting them earlier in this file doesn't work in X)
(require 'init-locales)

;; 允许用户提供包含个人设置的可选“init-local”
(require 'init-local nil t)

;;(require 'init-evil) ;; 模拟vim按键

(require 'init-pdf) ;; pdf


;; 邮箱配置
;;(require 'init-mail)
;;(require 'auth-source)
;;(setq auth-sources '("~/.emacs.d/.authinfo" "~/.emacs.d/.authinfo.gpg"))
(require 'init-gnus)


(provide 'init)

(put 'scroll-left 'disabled t)
