;;时间设置
(setq display-time-day-and-date t)                             ;打开日期显示
(setq display-time-24hr-format t)                              ;打开24小时显示模式
(display-time-mode 1)                                          ;启用时间显示设置minibuffers上打开时间显示
(display-time)                                                 ;显示时间
(setq display-time-format "%H:%M")                             ;设定时间显示格式


(provide 'init-time)
