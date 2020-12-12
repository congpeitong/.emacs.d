(defun sh-show-help ()
  "Show help with current mode as showtip."
  (interactive)
  (let ((help-handler (intern (concat "sh-" (symbol-name major-mode) "-handler")))
        help-message)
    (if (functionp help-handler)
        (progn
          (setq help-message (funcall help-handler))
          (if (equal help-message "")
              (message "No help available.")
            (showtip help-message)
            ))
      (message "The current major mode is not supported"))))

(defun sh-emacs-lisp-mode-handler ()
  "The help handler that for `emacs-lisp-mode'."
  (let (help)
    (setq help "")
    (if (equal 0 (variable-at-point))
        (if (function-called-at-point)
            (setq help (sh-elisp-get-help-text 'describe-function (function-called-at-point)))
          (if (face-at-point)
              (setq help (sh-elisp-get-help-text 'describe-variable (variable-at-point t)))))
      (setq help (sh-elisp-get-help-text 'describe-variable (variable-at-point))))))

(defun sh-elisp-get-help-text (func symbol)
  "Return help as text with special function and SYMBOL.
Argument FUNC get help information.
Argument SYMBOL special symbol at current point."
  (flet ((message (&rest args)))        ;for filter output message in echo area
    (let ((pop-up-frames nil)
          (wincfg (current-window-configuration)))
      (if (get-buffer "*Help*")
          (kill-buffer "*Help*"))

      (funcall func symbol)
      (if (get-buffer "*Help*")
          (progn
            (set-window-configuration wincfg)
            (with-current-buffer "*Help*" (buffer-string)))
        ""))))

(defun sh-lisp-interaction-mode-handler ()
  (sh-emacs-lisp-mode-handler))

(provide 'show-help)
