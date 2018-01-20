;; author: terry.xiong
;; e-mail: terry.yacumima@gmail.com

(setq user-full-name "terry.xiong")
(setq user-mail-address "terry_xiong@sohu.com")

;;使用lisp-mode打开.el文件
(setq auto-mode-alist (cons '("\\.el$" . lisp-mode) auto-mode-alist))

;;显示图片
(auto-image-file-mode t)

;;打开文件时自动猜测文件所用的编码
(require 'unicad)

;;使用主题 https://github.com/emacs-jp/replace-colorthemes
(load-theme 'calm-forest t t)
(enable-theme 'calm-forest)


;;可以做一些语法高亮的事情，网上说很强大，需要研究
(global-font-lock-mode t)
(font-lock-add-keywords 'lisp-mode '("[(]" "[)]")) ;在lisp mode下让给左右括号高亮

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示括号匹配
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; 支持emacs和外部程序的粘贴,通常都是默认支持的
;;(setq x-select-enable-clipboard t)

;; 在标题栏提示你目前在什么位置
(setq frame-title-format "JUST - GO -  ON")

;; 默认显示 80列就换行
(setq default-fill-column 80)

;; 去掉工具栏
(tool-bar-mode 0)

;;去掉菜单栏
(menu-bar-mode 0)

;; 去掉滚动栏
;;(scroll-bar-mode 0)

;;载入tab缩进策略
(setq tab-width 4)
(setq default-tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))

;;设置字体
;;方法为: emacs->options->Set Default Font->"M-x describe-font"查看当前使用的字体名称、字体大小
;;(set-default-font "-*-Menlo-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")

;;显示列号
(setq column-number-mode t)
(setq line-number-mode t)

;;启动emacs时窗口最大化
;;(defun my-maximized ()
;;  (interactive)
;;  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
;;  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
;;)
;;(my-maximized)

;; 启动窗口大小
(setq default-frame-alist '((height . 52) (width . 128)))

;;禁止自动保存
;;(auto-save-mode nil)

;;关闭备份
(setq make-backup-files nil)

;;显示行号
;;(require 'linum)
(global-linum-mode t)


;;添加evil https://github.com/emacs-evil/evil
(defun active-evil ()
  (interactive)
  (require 'evil)
  (evil-mode 1)
  (message "active evil")
)

;;让speedbar嵌入
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 26)
(setq sr-speedbar-auto-refresh t)
(setq speedbar-show-unknown-files t)
(setq speedbar-directory-unshown-regexp "^$")

;;添加smex https://github.com/nonsequitur/smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;跳轉到一行
(global-set-key "\C-cg" 'goto-line)

;;设置书签
(global-set-key "\C-cm" 'bookmark-set)
(global-set-key "\C-cj" 'bookmark-jump)
(global-set-key "\C-ckm" 'bookmark-delete)

;;关闭欢迎信息
(setq inhibit-startup-message 0)
(setq gnus-inhibit-startup-message 0)

;;insert a message flag where i modify the code
(defun insert-modify-flag-terry()
  "insert a message flag where i modify the code body"
  (interactive)
  (insert "modified by terry@" (format-time-string "%Y-%m-%d %k:%M")))

;;(global-set-key "\C-xc" 'insert-modify-flag-terry)

;;直接将c-s变为正则表达查找
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)

;;C-x p到文档尾
(global-set-key (kbd "C-x p") 'end-of-buffer)

;;C-x w到文档首
(global-set-key (kbd "C-x w") 'beginning-of-buffer)

;;C-k删除整行
(global-set-key (kbd "C-k") 'kill-whole-line)

;;C-x m选中标记
(global-set-key (kbd "C-x m") 'set-mark-command)

;;F1切换窗口
(global-set-key [f1] 'other-window)

;;F2纵向分割窗口
(global-set-key [f2] 'split-window-horizontally)

;;F3横向分割窗口
(global-set-key [f3] 'split-window-below)

;;F4Speed bar
(global-set-key [f4] 'sr-speedbar-toggle)

;;F5移除窗口
(global-set-key [f5] 'kill-buffer-and-window)

;;关闭提示音
;;(setq visible-bell nil)

;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(mouse-avoidance-mode 'animate)

;;使用鼠标中键可以粘贴
(setq mouse-yank-at-point t)

;;C-c e使用etags生成tags
(defun etags-terry ()
  (interactive)
  (shell-command "find . -name \"*.*\" -print | etags -")
  )
(global-set-key (kbd "C-c e") 'etags-terry)

(global-set-key (kbd "M-;") 'pop-tag-mark)

;;C-c r读取当前目录下的tags
(defun read-tags-terry ()
  (interactive)
  (visit-tags-table "./TAGS")
  )
(global-set-key (kbd "C-c r") 'read-tags-terry)

;;文件保存前自动删除行尾空白
(defun clear-white-spaces-terry ()
        "clear white spaces after line"
        (interactive)
        (save-excursion
            (push-mark)
            (goto-char(point-min))
            (replace-regexp " *$" "")
        )
)
;;(add-hook 'before-save-hook 'clear-white-spaces-terry)

;;用4个空格键替换tab键
(defun replace-tabs-terry ()
        "replace tab key with 4 spaces"
        (interactive)
        (save-excursion
            (push-mark)
            (goto-char(point-min))
            (replace-regexp "\t" "    ")
        )
 )
;;(add-hook 'before-save-hook 'replace-tabs-terry)

