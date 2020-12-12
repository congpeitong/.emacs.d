;;; init-whitespace.el --- Special handling for whitespace -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default show-trailing-whitespace nil)


;;; Whitespace

(defun sanityinc/show-trailing-whitespace ()
  "Enable display of trailing whitespace in this buffer."
  (setq-local show-trailing-whitespace t))

(dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
  (add-hook hook 'sanityinc/show-trailing-whitespace))


(require-package 'whitespace-cleanup-mode)
(add-hook 'after-init-hook 'global-whitespace-cleanup-mode)
(after-load 'whitespace-cleanup-mode
  (diminish 'whitespace-cleanup-mode))

(global-set-key [remap just-one-space] 'cycle-spacing)



; 后面设置tab-width部分只是个人喜好，与本问题无关
;; 当打开makefile文件时，禁用whitespace-cleanup-mode。其他类似需要保留TAB的文件类型也可以采用这种方法
(add-hook 'makefile-mode-hook
          (lambda ()
            (whitespace-cleanup-mode 0)
            (setq tab-width 8)))



(provide 'init-whitespace)
;;; init-whitespace.el ends here
