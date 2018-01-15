;;this profile for javascript node.js html css

;;添加加载路径
(add-to-list 'load-path (concat my-emacser-path "/plugins/web.js"))
(add-to-list 'load-path (concat my-emacser-path "/plugins/web.js/mmm-mode"))
(add-to-list 'load-path (concat my-emacser-path "/plugins/web.js/js2-mode"))

;;添加js2-mode,编辑javascript
(require 'js2-mode)

;;添加vue-mode,编辑vue
(require 'vue-mode)


;;.vue文件使用vue-mode
(setq auto-mode-alist (cons '("\\.vue$" . vue-mode) auto-mode-alist))

;;.js文件使用js2-mode
(setq auto-mode-alist (cons '("\\.js$" . js2-mode) auto-mode-alist))

(defun active-vue-html-mode ()
  (interactive)
  (require 'vue-html-mode)
)









