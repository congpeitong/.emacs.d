;;------------设置(utf-8)模式------------
;;(set-language-environment 'Chinese-GB)
;;(set-language-environment 'utf-8)
;;(set-keyboard-coding-system 'utf-8)
;;(set-clipboard-coding-system 'utf-8)
;;(set-terminal-coding-system 'utf-8)
;;(set-buffer-file-coding-system 'utf-8)
;;(set-default-coding-systems 'utf-8)
;;(set-selection-coding-system 'utf-8)
;;(modify-coding-system-alist 'process "*" 'utf-8)
;;(setq default-process-coding-system '(utf-8 . utf-8))
;;(setq-default pathname-coding-system 'utf-8)
;;(set-file-name-coding-system 'utf-8)
;;(setq ansi-color-for-comint-mode t) ;;

;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插 入两个空格。
;;(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
;(setq sentence-end-double-space nil)



;;use unicode everywhere
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))
(prefer-coding-system 'utf-8-unix)
(modify-coding-system-alist 'process "*" 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(set-file-name-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")
(setq locale-coding-system 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;;windows没有启用unicode时，中文语言是gbk编码gb18030会导致有些中文字符找不到字体
(when (eq system-type 'windows-nt)
  (setq locale-coding-system 'chinese-gbk))

;;The clipboard on windows dose not play well with utf8
(unless (eq system-type 'windows-nt)
  (set-clipboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8))


(provide 'init-utf-8)
