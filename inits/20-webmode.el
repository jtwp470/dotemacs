;;; 20-webmode.el --- Webmode for Emacs
;;; Commentary:
;;; Code:
;;; 拡張子
(use-package web-mode
  :mode (("\\.jsp\\'"   . web-mode)
         ("\\.gsp\\'"  .  web-mode))
  :config
  (setq web-mode-auto-pairs t)
  (setq web-mode-markup-indent-offset 2) ;; html indent
  (setq web-mode-css-indent-offset 2)    ;; css indent
  (setq web-mode-code-indent-offset 2)   ;; script indent(js,php,etc..)
  (setq web-mode-enable-auto-pairing t)
  (setq indent-tabs-mode t)
  (setq tab-width 4))
;;; 20-webmode.el ends here