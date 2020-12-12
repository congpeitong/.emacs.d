;;窗口的设置
(defun spaceline--unicode-number (str)
    "Return a nice unicode representation of a single-digit number STR."
    (cond
     ((string= "1" str) "➊")
     ((string= "2" str) "➋")
     ((string= "3" str) "➌")
     ((string= "4" str) "➍")
     ((string= "5" str) "➎")
     ((string= "6" str) "➏")
     ((string= "7" str) "➐")
     ((string= "8" str) "➑")
     ((string= "9" str) "➒")
     ((string= "0" str) "➓")))
(window-numbering-mode t)
(defun window-number-mode-line ()
   "The current window number. Requires `window-numbering-mode' to be enabled."
   (when (bound-and-true-p window-numbering-mode)
    (let* ((num (window-numbering-get-number))
        (str (when num (int-to-string num))))
        (spaceline--unicode-number str))))

;;vim状态设置
(setq evil-normal-state-tag   (propertize "[Normal]" 'face '((:background "DarkGoldenrod2" :foreground "black")))
      evil-emacs-state-tag    (propertize "[Emacs]" 'face '((:background "SkyBlue2" :foreground "black")))
      evil-insert-state-tag   (propertize "[Insert]" 'face '((:background "chartreuse3") :foreground "white"))
      evil-motion-state-tag   (propertize "[Motion]" 'face '((:background "plum3") :foreground "white"))
      evil-visual-state-tag   (propertize "[Visual]" 'face '((:background "grey80" :foreground "black")))
      evil-operator-state-tag (propertize "[Operator]" 'face '((:background "purple"))))

;;显示文件目录
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

(defvar mode-line-directory
  '(:propertize
    (:eval (if (buffer-file-name) (concat " " (shorten-directory default-directory 20)) " "))
    face mode-line-directory)
  "Formats the current directory.")
(put 'mode-line-directory 'risky-local-variable t)


;;侧边显示行号
;;简化 major-mode 名字,替换表中没有的显示原名
(defun codefalling//simplify-major-mode-name ()
  "Return simplifyed major mode name"
  (let* ((major-name (format-mode-line "%m"))
         (replace-table '(Emacs-Lisp "𝝀"
                                     Spacemacs\ buffer "𝓢"
                                     Python "𝝅"
                                     Shell ">"
                                     Makrdown "𝓜"
                                     GFM "𝓜"
                                     Org "𝒪"
                                     Text "𝓣"
                                     Fundamental "ℱ"
                                     C/*lah "C语言"
                                     C++//lah "C++"
                                     Java//lah "JAVA"
                                     ))
         (replace-name (plist-get replace-table (intern major-name))))
    (if replace-name replace-name major-name
        )))

;;以下是加入的
;;语法检查
(setq my-flycheck-mode-line
        '(:eval
          (pcase flycheck-last-status-change
            (`not-checked nil)
            (`no-checker (propertize " -" 'face 'warning))
            (`running (propertize " ✷" 'face 'success))
            (`errored (propertize " !" 'face 'error))
            (`finished
             (let* ((error-counts (flycheck-count-errors flycheck-current-errors))
                    (no-errors (cdr (assq 'error error-counts)))
                    (no-warnings (cdr (assq 'warning error-counts)))
                    (face (cond (no-errors 'error)
                                (no-warnings 'warning)
                                (t 'success))))
               (propertize (format "[%s/%s]" (or no-errors 0) (or no-warnings 0))
                           'face face)))
            (`interrupted " -")
            (`suspicious '(propertize " ?" 'face 'warning)))))


;;编码设置
(defun buffer-encoding-abbrev ()
    "The line ending convention used in the buffer."
    (let ((buf-coding (format "%s" buffer-file-coding-system)))
      (if (string-match "\\(dos\\|unix\\|mac\\)" buf-coding)
          (match-string 1 buf-coding)
        buf-coding)))
(defun mode-line-fill (face reserve)
    "Return empty space using FACE and leaving RESERVE space on the right."
    (unless reserve
      (setq reserve 20))
    (when (and window-system (eq 'right (get-scroll-bar-mode)))
      (setq reserve (- reserve 3)))
    (propertize " "
                'display `((space :align-to
                                  (- (+ right right-fringe right-margin) ,reserve)))
                'face face))
;以此为止

(setq-default mode-line-format
 (list             
  " %1"
  '(:eval (propertize
           (window-number-mode-line)
           'face
           'font-lock-type-face))
  " "
  ;;evil  vim状态
  '(:eval (evil-generate-mode-line-tag evil-state))
   ;; the buffer name; the file name as a tool tip
  mode-line-directory
  '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                      'help-echo (buffer-file-name)))
  ;; line and column
  "(" ;; '%02' to set to 2 chars at least; prevents flickering
  (propertize "%02l" 'face 'font-lock-type-face) ","
  (propertize "%02c" 'face 'font-lock-type-face)
  ") "
  ;; relative position, size of file
  "["
  (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
  "/"
  (propertize "%I" 'face 'font-lock-constant-face) ;; size
  "] "

  "[" ;; insert vs overwrite mode, input-method in a tooltip
  '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                      'face 'font-lock-preprocessor-face
                      'help-echo (concat "Buffer is in "
                                         (if overwrite-mode "overwrite" "insert") " mode")))

  ;; was this buffer modified since the last save?
  '(:eval (when (buffer-modified-p)
            (concat ","  (propertize "Mod"
                                     'face 'font-lock-warning-face
                                     'help-echo "Buffer has been modified"))))

  ;; is this buffer read-only?
  '(:eval (when buffer-read-only
            (concat ","  (propertize "RO"
                                     'face 'font-lock-type-face
                                     'help-echo "Buffer is read-only"))))
  "] "
  ;;major name
"["

  '(:eval (propertize (codefalling//simplify-major-mode-name) 'face 'font-lock-string-face
                      'help-echo buffer-file-coding-system))
  "] "
 minor-mode-alist
 " "
 ;;电量
  mode-line-misc-info
" "
;; git info
"  "
 `(vc-mode vc-mode)
  ;;以下是加入的

 (mode-line-fill 'mode-line 30)
 ;;语法提示
   "%1 "
   my-flycheck-mode-line
   "%1 "
   ;;行数和列数
   "(" ;; '%02' to set to 2 chars at least; prevents flickering
     (propertize "%02l" 'face 'font-lock-type-face) ","
     (propertize "%02c" 'face 'font-lock-type-face)
     ") "
     " "
     ;;code-language
   '(:eval (buffer-encoding-abbrev))
   " "
;; add the time, with the date and the emacs uptime in the tooltip
  '(:eval (propertize (format-time-string "%H :%M")
                      'help-echo
                      (concat (format-time-string "%c; ")
                              (emacs-uptime "Uptime:%hh"))))
  mode-line-end-spaces

  ;" --"
  ;; i don't want to see minor-modes; but if you want, uncomment this:
  ;; minor-mode-alist  ;; list of minor modes
  ;"%-" ;; fill with '-'
  ))


;;2.自动隐藏modeline
;(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa-cong"))
;(awesome-tray-mode 1)


(provide 'init-modelines)
