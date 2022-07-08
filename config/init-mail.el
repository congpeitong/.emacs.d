(setq message-send-mail-function 'smtpmail-send-it)
(setq user-mail-address "congpeitong2022@163.com")
(setq user-full-name "congpeitong")
(setq smtpmail-smtp-user "congpeitong2022@163.com"
      smtpmail-smtp-server "smtp.163.com"
      smtpmail-smtp-service 465
      smtpmail-stream-type 'ssl)

;; Debug
(setq smtpmail-debug-info t)
(setq smtpmail-debug-verb t)






(provide 'init-mail)
