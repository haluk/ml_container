((nil . ((eval . (progn
                   ;; set path to the python modules directory
                   (add-to-list 'exec-path (concat (locate-dominating-file default-directory dir-locals-file) "bin/"))
                   ;; configure inferior python shell.
                   (setq python-shell-interpreter "pythondocker"))))))
