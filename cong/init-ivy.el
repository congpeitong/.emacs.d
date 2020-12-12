 (use-package ivy
:defer 1
:config
(setq ivy-initial-inputs-alist nil
      ivy-wrap t
      ivy-height 15
      ivy-fixed-height-minibuffer t
      ivy-format-function #'ivy-format-function-line
      )
(ivy-mode +1)
:bind ([remap switch-to-buffer] . #'ivy-switch-buffer)
)

;;ivy-postframe
(use-package ivy-posframe
:defer 1
:after (ivy)
:config
(setq ivy-display-function #'ivy-posframe-display-at-point
      ivy-fixed-height-minibuffer nil
      ivy-posframe-parameters
      `((min-width . 90)
    (min-height .,ivy-height)
    (internal-border-width . 10))))


;;counsel
(use-package counsel
  :defer 1
  :after (ivy)
  :bind (([remap execute-extended-command] . counsel-M-x)
     ([remap find-file]                . counsel-find-file)
     ([remap find-library]             . find-library)
     ([remap imenu]                    . counsel-imenu)
     ([remap recentf-open-files]       . counsel-recentf)
     ([remap org-capture]              . counsel-org-capture)
     ([remape swiper]                  . counsel-grep-or-swiper)
     ([remap describe-face]            . counsel-describe-face)
     ([remap describe-function]        . counsel-describe-function)
     ([remap describe-variable]        . counsel-describe-variable))

  :config
  (setq counsel-find-file-ignore-regexp "\\(?:^[#.]\\)\\|\\(?:[#~]$\\)\\|\\(?:^Icon?\\)"
    counsel-rg-base-command "rg -zS --no-heading --line-number --color never %s ."
    counsel-ag-base-command "ag -zS --nocolor --nogroup %s"
    counsel-pt-base-command "pt -zS --nocolor --nogroup -e %s")
  )

;;swiper
(use-package swiper
:defer 1
:bind ("C-s" . swiper))

;;counsel-projectile
(use-package counsel-projectile
  :after projectile
  :commands (counsel-projectile-find-file counsel-projectile-find-dir counsel-projectile-switch-to-buffer
                                          counsel-projectile-grep counsel-projectile-ag counsel-projectile-switch-project)
  :init
  :bind (([remap projectile-find-file]        . counsel-projectile-find-file)
         ([remap projectile-find-dir]         . counsel-projectile-find-dir)
         ([remap projectile-switch-to-buffer] . counsel-projectile-switch-to-buffer)
         ([remap projectile-grep]             . counsel-projectile-grep)
         ([remap projectile-ag]               . counsel-projectile-ag)
         ([remap projectile-switch-project]   . counsel-projectile-switch-project)))

;;模糊匹配
(use-package flx
:defer t
:init
(setq ivy-re-builders-alist
      '((counsel-ag . ivy--regex-plus)
    (counsel-grep . ivy--regex-plus)
    (swiper . ivy--regex-plus)
    (t . ivy--regex-fuzzy))
      ivy-initial-inputs-alist nil)
)

   

(provide 'init-ivy)
;;; init-ivy.el ends here
