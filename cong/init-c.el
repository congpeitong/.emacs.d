;;;; c mode ;;;;
(defvar xgp-cfsi-left-PAREN-old nil
  "Command used to input \"(\"")
(make-variable-buffer-local 'xgp-cfsi-left-PAREN-old)

(defun xgp-cfsi-modify-alist (alist term new)
  (let ((tl (assq term (symbol-value alist))))
    (if tl
        (setcdr tl new)
      (add-to-list alist (cons term new)))))

(defun xgp-cfsi (style)
  "Deciding whether using CFSI."
  (interactive "Style: ")
  (c-set-style style)
  (setq indent-tabs-mode
        nil
        c-hanging-semi&comma-criteria
        (quote (c-semi&comma-inside-parenlist)))

  (xgp-cfsi-modify-alist 'c-hanging-braces-alist 'class-open nil)
  (xgp-cfsi-modify-alist 'c-hanging-braces-alist 'class-close nil)
  (local-set-key " " 'self-insert-command))

(defun xgp-cfsi-erase-blanks ()
  "Erase all trivial blanks for CFSI."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (replace-match "" nil nil))))

(defun linux-c-mode()
  (define-key c-mode-map [return] 'newline-and-indent)
  (setq imenu-sort-function 'imenu--sort-by-name)
  (interactive)
  (imenu-add-menubar-index)
  (which-function-mode)
  (c-toggle-auto-state)
  (c-toggle-hungry-state)
  (setq indent-tabs-mode nil)
  (xgp-cfsi "linux"))
(add-hook 'c-mode-common-hook 'linux-c-mode)

;;header
;;(use-package company-c-headers
 ;; :functions maple/company-backend
  ;;:init (maple/company-backend 'c-mode-hook 'company-c-headers))



;;自动插入头文件
(defun hash-table-insert-info (format files)
""
(let ((table (make-hash-table)))
(puthash :format format table)
(puthash :files files table)
table
)
)

(defun convert-list-to-hash-table (lst)
""
(let ((table (make-hash-table)))
(mapc '(lambda (element) (puthash (nth 0 element) (nth 1 element) table)) lst)
table
)
)

(setq c-common-files '("stdio" "stdlib" "strings" "string" "unistd" "sys/types" "errno"))
(setq c-insert-format "#include <%s.h>\n")

(setq python-common-files '("os" "sys" "types"))
(setq python-insert-format "import %s\n")

(setq list-insert-files (list (list 'c-mode (hash-table-insert-info c-insert-format c-common-files))
(list 'python-mode (hash-table-insert-info python-insert-format python-common-files))))

(setq hash-table-insert (convert-list-to-hash-table list-insert-files))




(defun insert-module-files (&optional lst)
""
(interactive "sfiles: ")
(let ((info (gethash major-mode hash-table-insert))
(lst (split-string lst)))
(if (not info) (error "%s isn't support." major-mode))
(if (not lst) (setq lst (gethash :files info)))
(mapc '(lambda (f) (insert (format (gethash :format info) f))) lst)
)
)

(defun auto-insert-common-header-file ()
""
(interactive)

(if (and (< (buffer-size) 6) (gethash major-mode hash-table-insert)) (insert-module-files ""))
)

(add-hook 'after-change-major-mode-hook 'auto-insert-common-header-file)










(provide 'init-c)
