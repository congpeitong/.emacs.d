(setq load-path(cons(file-truename"~/.emacs.d/")load-path))
;;(add-to-list 'load-path (expand-file-name "~/.emac.d/liberime"))
(require 'pyim)
(require 'posframe)
(require 'liberime)
(setq default-input-method "pyim")
(setq pyim-page-tooltip 'posframe)
(setq pyim-page-length 9)
(liberime-start "/usr/share/rime-data/"(file-truename"~/.emacs.d/pyim/rime"))
(liberime-select-schema "luna_pinyin_simp")
(setq pyim-default-scheme 'rime-quanpin)




(provide 'init-pyim)

