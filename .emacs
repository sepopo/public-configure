;======================================================;
;                 lispの設定フォルダの場所
;======================================================;
(setq load-path (cons "~/.lisp/" load-path))
;======================================================;
;                  ウインドウを１つに
;======================================================;
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
;======================================================;
;                      タブ可視化
;======================================================;
(setq whitespace-style
      '(tabs tab-mark spaces space-mark))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□])
        (tab-mark   ?\t   [?\xBB ?\t])
        ))
(require 'whitespace)
(global-whitespace-mode 1)
(set-face-foreground 'whitespace-space "LightSlateGray")
(set-face-background 'whitespace-space "DarkSlateGray")
(set-face-foreground 'whitespace-tab "LightSlateGray")
(set-face-background 'whitespace-tab "DarkSlateGray")
(setq-default show-trailing-whitespace t)
;======================================================;
;             バックアップファイルを作らない
;======================================================;
(setq make-backup-files nil)
;======================================================;
;              [F12]で列を数字表記
;======================================================;
(autoload 'setnu-mode "setnu" nil t)
(global-set-key [f12] 'setnu-mode)
;======================================================;
;                  php-mode
;======================================================;
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.lisp")
(add-hook 'php-mode-hook
(lambda ()
(require 'php-completion)
(php-completion-mode t)
(define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
(when (require 'auto-complete nil t)
(make-variable-buffer-local 'ac-sources)
(add-to-list 'ac-sources 'ac-source-php-completion)
(auto-complete-mode t))))
;======================================================;
;                  php-mode
;======================================================;
(autoload 'php-mode "php-mode")
(setq auto-mode-alist
       (cons '("\\.php\\'" . php-mode) auto-mode-alist))
(setq php-mode-force-pear t)
(add-hook 'php-mode-user-hook
   '(lambda ()
      (setq php-manual-path "/usr/local/share/php/doc/html")
      (setq php-manual-url "http://www.phppro.jp/phpmanual/")))
;======================================================;
;                  html-helper-mode
;======================================================;
;(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
;======================================================;
;                  each-mode-option
;======================================================;
;(setq auto-mode-alist
;      (append
;	'(
;	  ("\\.h$"    . c++-mode)
;	   ("\\.hpp$"  . c++-mode)
;	    ("\\.txt$"  . text-mode)
;	     ("\\.message$" . text-mode)
;	      ("\\.htm" . html-helper-mode)
;	       ("\\.shtml$" . html-helper-mode)
;		 ) auto-mode-alist))
;======================================================;
;                   css-mode                  
;======================================================;
;(autoload 'css-mode "css-mode")
;(setq auto-mode-alist (cons '("\\.css$" . css-mode) auto-mode-alist))
;======================================================;
;                  範囲を色づけ                  
;======================================================;
(setq transient-mark-mode t)
(setq highlight-nonselected-windows t)
;======================================================;
;             ホイールマウスの設定
;======================================================;
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mouse t)
;======================================================;
;             対応する括弧を光らせる                 
;======================================================;
