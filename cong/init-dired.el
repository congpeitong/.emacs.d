;;每一次你进入一个回车进入一个新的目录中是，一个新的缓冲区就会被建立。这使 得我们的缓冲区列表中充满了大量没有实际意义的记录。我们可以使用下面的代码，让 Emacs 重用唯一的一个缓冲区作为 Dired Mode 显示专用缓冲区

(put 'dired-find-alternate-file 'disabled nil)
;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))











(provide 'init-dired)
