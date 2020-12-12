;;; easy-after-load-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "easy-after-load" "easy-after-load.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from easy-after-load.el

(autoload 'easy-after-load "easy-after-load" "\
Add `eval-after-load' statements for all features with corresponding
files in DIRECTORY (or `easy-after-load-directory' if nil).

See also `easy-after-load-pattern', `easy-after-load-function'.

\(fn &optional DIRECTORY)" nil nil)

(autoload 'easy-auto-mode "easy-after-load" "\
Add entries to `auto-mode-alist' for each element in MODES.

Each element looks like (MODE REGEXP REGEXP ...).

Example:
    (easy-auto-mode
     '((ruby-mode \"\\\\.rake$\" \"^Rakefile$\")
       (markdown-mode \"\\\\.md$\")))

\(fn MODES)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "easy-after-load" '("easy-after-load-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; easy-after-load-autoloads.el ends here
