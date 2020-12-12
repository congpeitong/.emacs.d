(require 'company)
(require 'company-yasnippet)
(require 'company-dabbrev)
(require 'company-files)
(require 'company-tabnine)
(require 'company-tng)

;;全局开启
;;(add-hook 'after-init-hook 'global-company-mode)
;;显示序号
(setq company-show-numbers t)
;;菜单延迟
(setq company-idle-delay 0.2)
;;开始补全的数字
(setq company-minimum-prefix-length 1)
;;allow input string that do not match candidate words
(setq company-require-match nil)
;; 补全时能识别简写，这个是说如果我写了 "import tensorflow as tf" ，那么我再输入 "tf." 的时候能自动补全
(setq jedi:use-shortcuts t)
;; 让补全列表里的各项左右对齐
(setq company-tooltip-align-annotations t)
;; 补全列表里的项按照使用的频次排序，这样经常使用到的会放在前面，减少按键次数
(setq company-transformers '(company-sort-by-occurrence))
;; 解决删除一个字符后补全提示就没有了的问题
(add-to-list 'company-begin-commands  'backward-delete-char-untabify)
(add-to-list 'company-begin-commands  'backward-kill-word)
;;custom company backends
(setq company-backends(delete 'company-xcode company-backends))
(setq company-backends(delete 'company-bbdb company-backends))
(setq company-backends(delete 'company-eclim company-backends))
(setq company-backends(delete 'company-etags company-backends))
(setq company-backends(delete 'company-oddmuse company-backends))
(add-to-list 'company-backends 'company-files)

;;以下是抄袭
;; TabNine
(add-to-list 'company-backends #'company-tabnine)

;; The free version of TabNine is good enough,
;; and below code is recommended that TabNine not always
;; prompt me to purchase a paid version in a large project.
(defadvice company-echo-show (around disable-tabnine-upgrade-message activate)
  (let ((company-message-func (ad-get-arg 0)))
    (when (and company-message-func
               (stringp (funcall company-message-func)))
      (unless (string-match "The free version of TabNine only indexes up to" (funcall company-message-func))
        ad-do-it))))

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;; Use the tab-and-go frontend.
;; Allows TAB to select and complete at the same time.
(company-tng-configure-default)
(setq company-frontends
      '(company-tng-frontend
        company-pseudo-tooltip-frontend
        company-echo-metadata-frontend))

;; Enable global.
(global-company-mode)

;; Don't downcase the returned candidates.
(setq company-dabbrev-downcase nil)
(setq company-dabbrev-ignore-case t)

;; Add `company-elisp' backend for elisp.
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (require 'company-elisp)
             (push 'company-elisp company-backends)))


;; Add yasnippet support for all company backends.
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))







;;python
(add-hook 'python-mode 'comany-mode)

;;c/c++
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c++-mode-hook 'company-mode)
;;java
(add-hook 'java-mode-hook 'company-mode)
;;emacs
(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook 'lisp-mode-hook 'company-mode)
(add-hook 'lisp-interaction-mode-hook 'company-mode)
;;web
(add-hook 'web-mode-hook 'company-mode)
;;html
(add-hook 'html-mode-hook 'company-mode)
;;js
(add-hook 'js-mode-hook 'company-mode)
;;css
(add-hook 'css-mode-hook 'company-mode)




(custom-set-faces
'(company-preview ((t (:background "gold3" :foreground "black"))))
 '(company-preview-common ((t (:background "gold3" :foreground "grey20"))))
 '(company-preview-search ((t (:background "green4" :foreground "green"))))
 '(company-scrollbar-bg ((t (:background "#303030"))))
 '(company-scrollbar-fg ((t (:background "#404040"))))
 '(company-tooltip ((t (:background "#202020" :foreground "grey"))))
 '(company-tooltip-annotation ((t (:foreground "gold"))))
 '(company-tooltip-annotation-selection ((t (:foreground "white"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :foreground "white"))))
 '(company-tooltip-common-selection ((t (:foreground "white"))))
 '(company-tooltip-selection ((t (:background "red3" :foreground "white"))))
 )

(provide 'init-company)
