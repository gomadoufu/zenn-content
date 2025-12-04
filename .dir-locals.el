;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((org-mode . ((eval . (progn
                        ;; Zenn preview process を起動
                        (unless (get-process "zenn-preview")
                          (let ((default-directory (expand-file-name "~/Documents/org-mode/article/zenn-content/")))
                            (start-process "zenn-preview"
                                         "*zenn-preview*"
                                         "npx"
                                         "zenn"
                                         "preview")))
                        
                        ;; 保存時に自動エクスポート
                        (add-hook 'after-save-hook
                                  (lambda ()
                                    (when (and (eq major-mode 'org-mode)
                                               (string-prefix-p
                                                (expand-file-name "~/Documents/org-mode/article/zenn-content/")
                                                (buffer-file-name)))
                                      (org-zenn-export-to-markdown)))
                                  nil t))))))
