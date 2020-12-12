(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa-cong"))

(require 'flex)

(add-to-list 'auto-mode-alist '("\\.l$" . flex-mode))
(autoload 'flex-mode "flex")




(provide 'init-flex)
