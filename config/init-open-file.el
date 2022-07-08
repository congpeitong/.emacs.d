;; 打开配置文件
(defun cong-open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 打开工作文件
(defun cong-open-work-file ()
  (interactive)
  (find-file "e:/work_open_source"))

;; 打开笔记目录
(defun cong-open-note-file ()
  (interactive)
  (find-file "e:/my_source_code/notes"))

(provide 'init-open-file)
