
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-12"))

;src: .emacs from unkn2000
(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;                         ("marmalade" . "https://marmalade-repo.org/packages/")
                          ("melpa" . "https://melpa.org/packages/"))
;;                         ("melpa" . "https://melpa.milkbox.net/packages/"))
                         )

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-use-system-font t)
 '(c-basic-offset 2)
 '(company-backends
   (quote
    (company-irony company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
                   (company-dabbrev-code company-keywords)
                   company-oddmuse company-dabbrev)))
 '(company-idle-delay 0.2)
 '(company-minimum-prefix-length 2)
 '(company-search-regexp-function (quote company-search-flex-regexp))
 '(company-show-numbers t)
 '(company-tooltip-align-annotations t)
 '(custom-safe-themes
   (quote
    ("b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" default)))
 '(ido-enable-flex-matching t)
 '(indent-tabs-mode nil)
 '(undo-limit 80000000)
 '(undo-outer-limit 12000000000)
 '(undo-strong-limit 120000000))
'(js-indent-level 2)
(setq vc-handled-backends nil)

(add-to-list 'load-path "~/.emacs.d/mine")
(setq-default indent-tabs-mode nil)

;; pe mine ma enerveaza menu-bar in text mode :)
;; (menu-bar-mode -1)

(require 'better-defaults)

;ido
(require 'ido)
(ido-mode t)

(require 'cparen)
(cparen-activate)

; disable git stuf
(setq vc-handled-backends nil)
; show column number
(setq column-number-mode t)
; show paren
(show-paren-mode 1)

;; vertical insert, I use it, Im leaving it just in case, delete if not needed.
(global-set-key (kbd "C-x r I") 'string-insert-rectangle)
; (setq frame-background-mode "dark")

(global-hi-lock-mode 1)

;; este explicatie mai jos pt asta, e pt commends (M-;) - e aware de unde e cursorul si face commend
;; in functie de asta
(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'comment-dwim-line)
;; (global-set-key (kbd "M-K") 'kill-whole-line)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
; (fa-config-default)
(put 'scroll-left 'disabled nil)
;(load-theme 'solarized)

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)


(setq server-socket-dir (format "/tmp/emacs%d" (user-uid)))

(blink-cursor-mode 0)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(default ((t (:family "fixed" :foundry "misc" :slant normal :weight normal :height 98 :width semi-condensed)))) ;this makes the window smaller until finished initializing
 )

;; haskell
;(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;(require 'haskell-snippets)
(setq-default yas-prompt-functions '(yas-ido-prompt yas-dropdown-prompt))

;; rainbow stuff
;; (setq rainbow-identifiers-choose-face-function 'rainbow-identifiers-cie-l*a*b*-choose-face
;;       rainbow-identifiers-cie-l*a*b*-saturation 100
;;       rainbow-identifiers-cie-l*a*b*-lightness 40
;;       ;; override theme faces
;;       rainbow-identifiers-faces-to-override '(highlight-quoted-symbol
;;                                               font-lock-keyword-face
;;                                               font-lock-function-name-face
;;                                               font-lock-variable-name-face))
;; alte culori pt rainbow identifiers, check it out
(require 'rainbow-identifiers)
(cl-loop for i from 1 to 15 do
      (let* ((lightness 60)
             (saturation 90)
             (angle (* 2 pi (/ i 15.0)))
             (a (* saturation (cos angle)))
             (b (* saturation (sin angle))))
        (set-face-attribute
         (intern (format "rainbow-identifiers-identifier-%s" i))
         nil
         :foreground (apply 'color-rgb-to-hex
                                                        (color-lab-to-srgb lightness a b)))))


;; when to use rainbow
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)


;; company mode
(add-hook 'after-init-hook 'global-company-mode)

;; irony -- totally reccomend it
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)


(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; irony done
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; ghc-mod
;(autoload 'ghc-init "ghc" nil t)
;(autoload 'ghc-debug "ghc" nil t)
;(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; company-ghc
;(eval-after-load 'company
;  '(add-to-list 'company-backends 'company-ghc))


;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-clangcheck-analyze t)

;; helm
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)

;; helm projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-enable-caching t)

;; geriser/racket
(setq geiser-active-implementations '(racket))

;; python
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; crazy -- e err, un fel de ci" din vim :)
(defun backward-up-sexp (arg)
  (interactive "p")
  (let ((ppss (syntax-ppss)))
    (cond ((elt ppss 3)
           (goto-char (elt ppss 8))
           (backward-up-sexp (1- arg)))
          ((backward-up-list arg)))))

(global-set-key [remap backward-up-list] 'backward-up-sexp)
;; (global-set-key [remap mark-word] 'mark-sexp)
(global-set-key [remap just-one-space] 'cycle-spacing)
;; (global-set-key [remap just-one-space] 'mark-sexp)
;; (global-set-key (kbd "M-S SPC") 'mark-sexp)


;; helm
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)

