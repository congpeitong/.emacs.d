;;=======================================================================================
;;      基础快捷键说明: M (Alt) C (Ctrl) S(shift) s(super) M-x (Alt+x) C-x (Ctrl+x)
;;========================================================================================
;;                                  插件管理器配置
;;========================================================================================
;;
;;  M-x package-list-packages 列出插件列表
;;  i  - 选择要安装的包
;;  d  - 选择要删除的包
;;  U  - 升级已安装的包
;;  x  - 执行操作
;;  M-x package－install 插件名(这种方法也可以安装插件)
;;  C-s 搜索插件,再次按则向下继续搜索
;;  M-x package-autoremove 自动移除不需要的插件
;;========================================================================================
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			             ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")

			 )
      )
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

;; 定义require-package函数
(defun require-package (package &optional min-version no-refresh)
"Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
(if (package-installed-p package min-version)
t
(if (or (assoc package package-archive-contents) no-refresh)
(package-install package)
(progn
(package-refresh-contents)
(require-package package min-version t)))))

(package-initialize)







(provide 'init-package)
