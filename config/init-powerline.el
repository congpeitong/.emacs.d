;; ===============powerLine状态栏=======================
;;(require-package 'powerline)
;;(setq powerline-default-separator 'wave)
;;(powerline-default-theme)
;;(powerline-center-theme)
;;(powerline-center-evil-theme)
;;(powerline-vim-theme)
;;(powerline-nano-theme)


;; ==============spaceLine 状态栏===================
(require-package 'spaceline)
(require 'spaceline-config) ;; 不知道是否还需要暂时先留着
(spaceline-emacs-theme)
(setq winum-auto-setup-mode-line nil)
(require-package 'winum)
(winum-mode)
;;(spaceline-spacemacs-theme)
;;(spaceline-helm-mode)
;;(spaceline-info-mode)







(provide 'init-powerline)
