(require 'cnfonts)
;;; Code:
(add-hook 'org-mode-hook
          '(lambda ()
             (setq fontset-orgtable
                   (create-fontset-from-ascii-font "Monaco 14"))
             (dolist (charset '(han symbol cjk-misc))
               (set-fontset-font fontset-orgtable charset
                                 (font-spec :family "Hiragino Sans GB W3"
                                            :size 16)))
             (set-face-attribute 'org-table nil
                                 :font "Monaco 14"
                                 :fontset fontset-orgtable)))
(require 'org)
(provide 'init-org)
