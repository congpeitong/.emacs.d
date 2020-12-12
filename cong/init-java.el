(require 'meghanada)
(require 'mvn)
(add-hook 'java-mode-hook
          (lambda ()
            ;; meghanada-mode on
            (meghanada-mode t)
            ;; enable telemetry
            (meghanada-telemetry-enable t)
            (flycheck-mode +1)
            (setq c-basic-offset 2)
            ;; use code format
            (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
(cond
   ((eq system-type 'windows-nt)
    (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
    (setq meghanada-maven-path "mvn.cmd"))
   (t
    (setq meghanada-java-path "java")
    (setq meghanada-maven-path "mvn")))
(use-package meghanada
  :bind
  (:map meghanada-mode-map
        (("C-M-o" . meghanada-optimize-import)
         ("C-M-t" . meghanada-import-all)
         )))
(defun tkj-java-meghanda-mode-hook ()
  (meghanada-mode)
  (flycheck-mode))
(add-hook 'java-mode-hook 'tkj-java-meghanda-mode-hook)

(provide 'init-java)
