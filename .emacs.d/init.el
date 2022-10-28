(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)


(package-initialize)

(setq package-list '(use-package))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


(package-install 'poet-theme)
(if (display-graphic-p) (load-theme 'poet t))
(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))
(unless (package-installed-p 'cider)
  (package-install 'cider))
(unless (package-installed-p 'paredit)
  (package-install 'paredit))
(unless (package-installed-p 'magit)
  (package-install 'magit))
(toggle-frame-fullscreen)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'cider-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-test-defining-forms '("deftest" "defspec" "defflow"))
 '(custom-safe-themes
   '("2d035eb93f92384d11f18ed00930e5cc9964281915689fa035719cab71766a15" default))
 '(initial-frame-alist '((fullscreen . maximized)))
 '(org-agenda-files
   '("~/org/agendas/personal.org" "~/org/agendas/brasil-paralelo.org" "~/org/agendas/paroquia-mogi.org" "~/org/agendas/clojure-type-system.org"))
 '(org-log-done 'time)
 '(package-selected-packages
   '(pdf-tools plantuml-mode poet-theme org-drill paredit clojure-mode)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
