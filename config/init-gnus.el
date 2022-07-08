(setq user-mail-address	"congpeitong2022@163.com"
      user-full-name	"congpeitong")

(setq gnus-select-method
      '(nnimap "foxmail.com"
               (nnimap-address "imap.163.com")
               (nnimap-user "congpeitong")
               (nnimap-server-port 993)
               (nnimap-stream ssl)
               (nnimap-authinfo-file "~/.emacs.d/.authinfo")))

(setq send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "smtp.163.com"
      smtpmail-smtp-user "congpeitong2022@163.com"
      smtpmail-smtp-service 465
      smtpmail-stream-type 'ssl
      smtpmail-auth-credentials "~/.emacs.d/.authinfo")


(provide 'init-gnus)
