;;ace-jump-mode  指哪打哪儿降低鼠标的使用频率
(global-set-key (kbd "C-c SPC") 'ace-jump-word-mode)
;;代码检索工具cscope 快捷键
(global-set-key (kbd "C-c g")   'cscope-find-global-definition)
;;dired 快捷键
;;ctrl+x  d  启动dired
;;q  后退或后退到上级目录
;;C  复制文件
;;R  重命名或移动文件
;;D  删除文件或文件夹
;;+  创建文件夹
;;Z  用gzip 解压/压缩文件
;;m  选中文件或文件夹
;;u  取消选择光标所在文件或文件夹
;;U  取消所有选中的文件或文件夹
;;g  刷新目录






;;打开目录树快捷键
(global-set-key [f8] 'neotree-toggle)
;;n：next line 
;;p：previous line
;;SPC or RET or TAB: Open current item if it is a file. Fold/Unfold current item if
;; it is a directory.
;;U：Go up a directory
;;g：Refresh
;;A：Maximize/Minimize the NeoTree Window
;;H：Toggle display hidden files
;;O：Recursively open a directory
;;C-c C-n：Create a file or create a directory if filename ends with a ‘/’
;;C-c C-d：Delete a file or a directory.
;;C-c C-r：Rename a file or a directory.
;;C-c C-c：Change the root directory.
;;C-c C-p：Copy a file or a directory.








;;未输入下一个命令，直接显示可能的下一个命令
(use-package which-key
  :defer 1
  :init
  (setq which-key-sort-order #'which-key-prefix-then-key-order
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-side-window-slot -10)
  :config
  (which-key-mode +1)
  )
(provide 'init-key)
