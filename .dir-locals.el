(
 (python-mode . (
                 (eval . (progn
                           ;; set path to the python modules directory
                           (add-to-list 'exec-path (concat (locate-dominating-file default-directory dir-locals-file) "bin/"))
                           ;; configure inferior python shell.
                           (setq-local python-shell-interpreter "pythondocker")
                           (setq-local python-shell-interpreter-interactive-arg "-i")
                           (setq-local python-shell-completion-native-enable nil)
                           ))))
 )
