(defconst *is-a-mac* (eq system-type 'darwin)) ;; 判断操作系统是否Mac系统
(defconst *is-linux* (eq system-type 'gnu/linux)) ;; 判断是否是Linux系统
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt))) ;; 判断是否是windows系统

(defconst *spell-check-support-enabled* t)  ;; 语法检查是否开启

(provide 'init-const)
