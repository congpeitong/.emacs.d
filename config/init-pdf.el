(when (or (featurep 'cocoa)
          (executable-find "epdfinfo"))
;;; Require
  (require 'pdf-tools)
  (require 'pdf-history)
  (require 'pdf-occur)
  (require 'pdf-links)
  (require 'pdf-outline)
  (require 'pdf-sync)
  (require 'pdf-tools-extension)

;;; Code:
  (pdf-tools-install)

  ;; midnite mode hook
  (add-hook 'pdf-view-mode-hook (lambda ()
                                  (pdf-view-midnight-minor-mode))) ; automatically turns on midnight-mode for pdfs

  (setq pdf-view-midnight-colors '("#00B800" . "#000000" )) ; set the green profile as default (see below)

  (defun pdf-no-filter ()
    "View pdf without colour filter."
    (interactive)
    (pdf-view-midnight-minor-mode -1)
    )

  ;; change midnite mode colours functions
  (defun pdf-midnite-original ()
    "Set pdf-view-midnight-colors to original colours."
    (interactive)
    (setq pdf-view-midnight-colors '("#839496" . "#002b36" )) ; original values
    (pdf-view-midnight-minor-mode)
    )

  (defun pdf-midnite-amber ()
    "Set pdf-view-midnight-colors to amber on dark slate blue."
    (interactive)
    (setq pdf-view-midnight-colors '("#ff9900" . "#0a0a12" )) ; amber
    (pdf-view-midnight-minor-mode)
    )

  (defun pdf-midnite-green ()
    "Set pdf-view-midnight-colors to green on black."
    (interactive)
    (setq pdf-view-midnight-colors '("#00B800" . "#000000" )) ; green
    (pdf-view-midnight-minor-mode)
    )

  (defun pdf-midnite-colour-schemes ()
    "Midnight mode colour schemes bound to keys"
    (local-set-key (kbd "!") (quote pdf-no-filter))
    (local-set-key (kbd "@") (quote pdf-midnite-amber))
    (local-set-key (kbd "#") (quote pdf-midnite-green))
    (local-set-key (kbd "$") (quote pdf-midnite-original))
    )

  (add-hook 'pdf-view-mode-hook 'pdf-midnite-colour-schemes)

  (lazy-load-unset-keys
   '(".")
   pdf-view-mode-map)                   ; 卸载按键
  (lazy-load-unset-keys
   '("x" "M-<" "M->")
   pdf-view-mode-map)                   ; 卸载一些按键
  (lazy-load-set-keys
   '(
     ([remap scroll-up] . pdf-view-next-line-or-next-page) ; 重新定向按键，支持auto-scroll
     )
   pdf-view-mode-map
   )
  (lazy-load-set-keys
   '(
     ("N" . pdf-view-next-page)                      ; 下一页
     ("P" . pdf-view-previous-page)                  ; 上一页
     ("," . pdf-view-first-page)                     ; 第一页
     ("." . pdf-view-last-page)                      ; 最后一页
     ("g" . pdf-view-goto-page)                      ; 跳到第几页
     ("e" . pdf-view-scroll-down-or-previous-page)   ; 向上滚动一屏
     ("SPC" . pdf-view-scroll-up-or-next-page)       ; 向下滚动一屏
     ("j" . pdf-view-next-line-or-next-page)         ; 下一行或下一屏
     ("k" . pdf-view-previous-line-or-previous-page) ; 上一行或上一屏
     ("O" . pdf-occur)                               ; 全局搜索
     ("q" . bury-buffer)                             ; 隐藏buffer
     ("Q" . kill-this-buffer)                        ; 退出
     ("s" . auto-scroll-mode)                        ; 自动滚屏
     ("<" . auto-scroll-faster)                      ; 加快滚屏速度
     (">" . auto-scroll-slower)                      ; 减慢滚屏速度
     )
   pdf-view-mode-map
   ))

(provide 'init-pdf)
