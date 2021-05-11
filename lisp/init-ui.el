;; ITERM2 MOUSE SUPPORT
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)



;; (when (boundp 'display-fill-column-indicator)
;;   (setq-default indicate-buffer-boundaries 'left)
;;   (setq-default fill-column 80)
;;   ;;(setq-default display-fill-column-indicator-character ?\u254e)
;;   (setq-default display-fill-column-indicator-character ?\u007c)
;;   (add-hook 'prog-mode-hook 'display-fill-column-indicator-mode))



(when window-system
;;set font
;; Auto generated by cnfonts
;; <https://github.com/tumashu/cnfonts>
(set-face-attribute
 'default nil
 :font (font-spec :name "-*-Courier New-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
                  :weight 'normal
                  :slant 'normal
                  :size 16.0))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font
   (frame-parameter nil 'font)
   charset
   (font-spec :name "-*-STKaiti-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
              :weight 'normal
              :slant 'normal
              :size 20.0)))
  )
;; change init frame size
;; (pushnew! initial-frame-alist '(width . 280) '(height . 75))
;;(add-hook 'window-setup-hook #'toggle-frame-maximized)
(add-hook 'window-setup-hook #'toggle-frame-fullscreen)

(load-theme 'tsdh-dark)
;;改变emacs标题栏的标题
;; (setq frame-title-format "MATRIX-EMACS")

;; (dashboard-setup-startup-hook)

;; (add-hook 'dashboard-mode-hook '(lambda () (setq mode-line-format nil)))

;; (setq dashboard-banner-logo-title "MATRIX EMACS - Enjoy Programming & Writing")
;; (setq dashboard-startup-banner (concat user-emacs-directory "logo.png"))

;; (setq dashboard-center-content t)
;; (setq dashboard-footer (format "Powered by Donney, %s" (format-time-string "2019-%Y")))
;; ;; FIXME: Insert copyright
;;     ;; @see https://github.com/emacs-dashboard/emacs-dashboard/issues/219
;;     (defun my-dashboard-insert-copyright ()
;;       "Insert copyright in the footer."
;;       (when dashboard-footer
;;         (insert "\n  ")
;;         (dashboard-center-line dashboard-footer)
;;         (insert (propertize dashboard-footer 'face 'font-lock-comment-face))
;;         (insert "\n")))
;; (advice-add #'dashboard-insert-footer :after #'my-dashboard-insert-copyright)


;; (with-eval-after-load 'ivy
;;  (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
;;  (define-key ivy-minibuffer-map (kbd "C-w") 'ivy-backward-kill-word)
;; (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line))

(advice-add #'display-startup-echo-area-message :override #'ignore)
;;init font
;; (cnfonts-enable)

;; Enable Cache
(setq url-automatic-caching t)
;; Example Key binding
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point+)

;; (require 'google-translate)
;; (require 'google-translate-default-ui)
;; (global-set-key "\C-ct" 'google-translate-at-point)
;; (global-set-key "\C-cT" 'google-translate-query-translate)

(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))


;; evil not need
;; use kill/yank up&down
;; use < >       left&right

;; (defun move-region-up (start end n)
;;   "Move the current line up by N lines."
;;   (interactive "r\np")
;;   (move-region start end (if (null n) -1 (- n))))

;; (defun move-region-down (start end n)
;;   "Move the current line down by N lines."
;;   (interactive "r\np")
;;   (move-region start end (if (null n) 1 n)))

;; (global-set-key (kbd "M-<up>") 'move-region-up)
;; (global-set-key (kbd "M-<down>") 'move-region-down)

;; (defun shift-text (distance)
;;   (if (use-region-p)
;;       (let ((mark (mark)))
;;         (save-excursion
;;           (indent-rigidly (region-beginning)
;;                           (region-end)
;;                           distance)
;;           (push-mark mark t t)
;;           (setq deactivate-mark nil)))
;;     (indent-rigidly (line-beginning-position)
;;                     (line-end-position)
;;                     distance)))

;; (defun shift-right (count)
;;   (interactive "p")
;;   (shift-text (if (null count) 1 count)))

;; (defun shift-left (count)
;;   (interactive "p")
;;   (shift-text (if (null count) -1 (- count))))


(provide 'init-ui)
