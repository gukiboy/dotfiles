(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(setq package-list '(use-package))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(use-package ob-clojure)
(require 'cider)
(setq org-babel-clojure-backend 'cider)

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
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)

(require 'inf-haskell)

(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)
(with-eval-after-load 'js
  (define-key js-mode-map (kbd "M-.") nil))

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      create-lockfiles nil)

(require 'prettier-js)
(use-package prettier-js
  :defer t
  :diminish prettier-js-mode
  :hook (((js2-mode rjsx-mode) . prettier-js-mode)))


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
 '(org-plantuml-jar-path "/Users/gustavokishima/plantuml.jar")
 '(package-selected-packages
   '(gnuplot-mode gnuplot ob-clojurescript org-babel-eval-in-repl pdf-tools ## plantuml-mode poet-theme org-drill paredit clojure-mode)))

(add-hook 'org-babel-after-execute-hook
          (lambda ()
            (when org-inline-image-overlays
              (org-redisplay-inline-images))))

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((gnuplot . t)))
;; add additional languages with '((language . t)))
(add-hook 'after-init-hook 'global-company-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
