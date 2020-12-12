(use-package smartparens
  :defer 1
  :commands (sp-pair sp-local-pairs)
  :config
  (require 'smartparens-config)
  (setq sp-highlight-pair-overlay nil
    sp-highlight-wrap-overlay nil
    sp-highlight-wrap-tag-overlay nil
    sp-show-pair-from-inside t
    sp-cancel-autoskip-on-backward-movement nil
    sp-show-pair-delay 0.1
    sp-max-pair-length 4
    sp-max-prefix-length 50
    sp-escape-quotes-after-insert nil)
  (smartparens-global-mode +1)
  )

(provide 'init-smartparents)

