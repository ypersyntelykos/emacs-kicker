;; turn off early (like starter-kit)
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(set-default-font "Envy Code R-10")
;;(set-default-font "Ubuntu Mono-11")
;; (set-default-font "Inconsolata-8")

;; border setting
;; (set-frame-parameter nil 'internal-border-width 0)
;;(add-to-list 'load-path "~/work/emacs/emacs-ipython-notebook")
;;(require 'ein)
;;(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;;;;(require 'el-get)
;; (unless (require 'el-get nil t)
;;   (url-retrieve
;;    "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
;;    (lambda (s)
;;      (let (el-get-master-branch)
;;        (goto-char (point-max))
;;        (eval-print-last-sexp)))))
;;

(unless (boundp 'user-emacs-directory)
  (defvar user-emacs-directory "~/.emacs.d/"
    "Directory beneath which additional per-user Emacs-specific
files are placed.
  Various programs in Emacs store information in this directory.
  Note that this should end with a directory separator.
  See also `locate-user-emacs-file'."))
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; (el-get 'sync)



(setq el-get-sources
     '(
       (:name pomodoro
              :type http
              :url "http://kanis.fr/hg/lisp/ivan/pomodoro.el")
 ;;     (;;el-get-bundle pycov2
 ;;      :name pycov2
 ;;       :url "https://github.com/mattharrison/pycoverage.el.git"
 ;;       ;; :features pycov2
 ;; ;; :load "pycov2.el"
 ;;       )
       )
)
;;(setq el-get-sources
;;      '(
;;        (:name pomodoro
;;               :type http
;;               :url "http://kanis.fr/hg/lisp/ivan/pomodoro.el")
;;        (:name smex                          ; a better (ido like) M-x
;;               :after (progn
;;                        (setq smex-save-file "~/.emacs.d/.smex-items")
;;                        (global-set-key (kbd "M-x") 'smex)
;;                        (global-set-key (kbd "M-X") 'smex-major-mode-commands)))
;;        (:name dot-mode
;;               :type git
;;               :url "https://github.com/emacsmirror/dot-mode.git"
;;               :features dot-mode)
;;        (:name ein
;;               :type github
;;               :url "https://github.com/millejoh/emacs-ipython-notebook.git"
;;               :depends (websocket request auto-complete)
;;               :load-path ("lisp")
;;               :submodule nil
;;               :features ein2)
;;        (:name pretty-mode
;;               :type git
;;               :url "https://github.com/mattharrison/pretty-mode.git"
;;               :features pretty-mode)
;;        (:name point-stack
;;               ;; in el-get!!!
;;               :after (progn
;;                        (global-set-key '[(f6)] 'point-stack-push)
;;                        (global-set-key '[(f7)] 'point-stack-pop)
;;                        (global-set-key '[(f8)] 'point-stack-forward-stack-pop)))
;;        ;; (:name tango-theme
;;        ;;        :type git
;;        ;;        :depends color-theme
;;        ;;        :url "https://github.com/mattharrison/emacs-tango-theme.git"
;;        ;;        :after (progn (if (eq window-system 'x)
;;        ;;                          (color-theme-tango)
;;
;;        ;;                        (if (not (window-system))
;;        ;;                            (color-theme-tty-dark))))
;;        ;;        :features tango-theme
;;        ;;        )
;;        ;; (:name flymake-python
;;        ;;        :type github
;;        ;;        :pkgname "mattharrison/flymake-python"
;;        ;;        :post-init (progn
;;        ;;                 (add-hook 'find-file-hook 'flymake-find-file-hook)
;;        ;;                 (when (load "flymake" t)
;;        ;;                   (defun flymake-pylint-init ()
;;        ;;                     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;        ;;                                        'flymake-create-temp-inplace))
;;        ;;                            (local-file (file-relative-name
;;        ;;                                         temp-file
;;        ;;                                         (file-name-directory buffer-file-name))))
;;        ;;                       (list "~/.emacs.d/el-get/flymake-python/pyflymake.py" (list local-file))))
;;        ;;                   ;;     check path
;;        ;;                   (add-to-list 'flymake-allowed-file-name-masks
;;        ;;                                '("\\.py\\'" flymake-pylint-init)))))
;;
;;        (:name nose
;;               :type git
;;               :url "https://github.com/mattharrison/nose.git"
;;               :after (progn ))
;;
;;        (:name sr-speedbar
;;               :type emacswiki)
;;        (:name idle-highlight-mode
;;               :type git
;;               :url "https://github.com/emacsmirror/idle-highlight-mode.git"
;;               )
;;        (:name protbuf
;;               :type emacswiki
;;               :features protbuf)
;;        (:name typopunct
;;               :type emacswiki
;;               :features typopunct
;;               :after (progn
;;                        (typopunct-change-language 'english t)
;;                        (defconst typopunct-ellipsis (decode-char 'ucs #x2026))
;;                        (defconst typopunct-middot   (decode-char 'ucs #xB7)) ; or 2219
;;                        (defun typopunct-insert-ellipsis-or-middot (arg)
;;                          "Change three consecutive dots to a typographical ellipsis mark."
;;                          (interactive "p")
;;                          (cond
;;                           ((and (= 1 arg)
;;                                 (eq (char-before) ?^))
;;                            (delete-char -1)
;;                            (insert typopunct-middot))
;;                           ((and (= 1 arg)
;;                                 (eq this-command last-command)
;;                                 ;; made python friendly (need 4 .'s for ...)
;;                                 (looking-back "\\.\\.\\."))
;;                            (replace-match "")
;;                            (insert typopunct-ellipsis))
;;                           (t
;;                            (self-insert-command arg))))
;;                        (define-key typopunct-map "." 'typopunct-insert-ellipsis-or-middot)
;;
;;                        (defadvice typopunct-insert-quotation-mark (around wrap-region activate)
;;                          (let* ((lang (or (get-text-property (point) 'typopunct-language)
;;                                           typopunct-buffer-language))
;;                                 (omark (if single
;;                                            (typopunct-opening-single-quotation-mark lang)
;;                                          (typopunct-opening-quotation-mark lang)))
;;                                 (qmark (if single
;;                                            (typopunct-closing-single-quotation-mark lang)
;;                                          (typopunct-closing-quotation-mark lang))))
;;                            (cond
;;                             (mark-active
;;                              (let ((skeleton-end-newline nil)
;;                                    (singleo (typopunct-opening-single-quotation-mark lang))
;;                                    (singleq (typopunct-closing-single-quotation-mark lang)))
;;                                (if (> (point) (mark))
;;                                    (exchange-point-and-mark))
;;                                (save-excursion
;;                                  (while (re-search-forward (regexp-quote (string omark)) (mark) t)
;;                                    (replace-match (regexp-quote (string singleo)) nil nil)))
;;                                (save-excursion
;;                                  (while (re-search-forward (regexp-quote (string qmark)) (mark) t)
;;                                    (replace-match (regexp-quote (string singleq)) nil nil)))
;;                                (skeleton-insert (list nil omark '_ qmark) -1)))
;;                             ((looking-at (regexp-opt (list (string omark) (string qmark))))
;;                              (forward-char 1))
;;                             (t ad-do-it))))
;;                        ;; C-q " gives a normal " (when in typopunct mode)
;;                        ;; from iso-trans.el
;;                        ;; ‘C-x 8 SPC gives a hard space.
;;                        ;; ‘C-x 8 o gives ° (degree symbol).
;;                        ;; ‘C-x 8 ~ ~ gives ¬.
;;                        ;; ‘C-x 8 1 / 2 gives ½.
;;                        ;; ‘C-x 8 * C gives ©.
;;                        ;; ‘C-x 8 ^ 1 gives superscript ¹, ‘C-x 8 ^ 2’ gives superscript ², and ‘C-x 8 ^ 3’ gives superscript ³.
;;
;;                        ))
;;
;;        ;; javascript stuff
;;        ;; don't use yegge's use better indent version
;;        (:name js2-mode
;;               :type git
;;               :url "https://github.com/mooz/js2-mode.git"
;;               :compile "js2-mode.el"
;;               :post-init (progn
;;                            (autoload 'js2-mode "js2-mode" nil t)))
;;        (:name writegood-mode
;;               :type git
;;               :url "https://github.com/bnbeckwith/writegood-mode.git"
;;               :features writegood-mode )
;;        (:name nyan-mode
;;               :website "http://nyan-mode.buildsomethingamazing.com/"
;;               :description "cat indicator"
;;               :type git
;;               :url "https://github.com/TeMPOraL/nyan-mode"
;;               :features nyan-mode)
;;        (:name yasnippet
;;               ;;:url "https://github.com/mattharrison/yasnippet.git")
;;               :pkgname "mattharrison/yasnippet")
;;        (:name clojure-snippets
;;               :type git
;;               :url "https://github.com/mpenet/clojure-snippets"
;;               ;:pkgname "mpenet/clojure-snippets"
;;               )
;;
;;        ;; (:name pycoverage
;;        ;;        :type git
;;        ;;        :url "https://github.com/mattharrison/pycoverage.el.git"
;;        ;;        :load "pycov2.el"
;;        ;;        :features pycov2)
;;        ;; (:name pycoverage
;;        ;; 	  :description "Coverage.py integration with emacs"
;;        ;; 	  :type github
;;        ;; 	  :pkgname "mattharrison/pycoverage"
;;        ;; 	  :features pycov2)
;;        ))
;;
;;


(setq my-packages
      (append
       '(
         el-get
	 ;;yasnippet
	 ;; this is for html mmm editing
	 ;;django-mode
	 ;;predictive
	 ;;python
	 ;;yasnippet
         ;;ace-jump-mode
         auto-complete
         avy
	 ;; color-theme  ;; borked
     cider
     clojure-mode
	 color-theme  ;; borked
	 ;; csv-mode
	 escreen                ; screen for emacs, C-\ C-h
     ;;flycheck
     exec-path-from-shell  ; make emacs see brew env (update /etc/paths)
	 full-ack
     guide-key
     popwin
     helm
	 highlight-indentation
	 highlight-parentheses
     langtool
     lispy
     iedit
     highlight
	 lua-mode
	 magit
	 ;; minimap
	 ;; monky
	 perspective
	 ;; python-mode
	 ;; pycov2
	 python-pep8
     pyvenv
     rainbow-mode         ; pretty css colors, etc
     ;;realgud ;; pydbgr-track-mode from shell running pdb to track
	 ;;sass-mode
     smartparens
     smooth-scrolling
     sudo-save
     switch-window          ; take over C-x o
     web-mode
     wgrep
     ;;undo-tree
     )
       (mapcar 'el-get-source-name el-get-sources)))



(el-get-bundle! pycov2 in  github:mattharrison/pycoverage.el
  :features pycov2
;;        ;; (:name pycoverage
;;        ;;        :type git
;;        ;;        :url "https://github.com/mattharrison/pycoverage.el.git"
;;        ;;        :load "pycov2.el"
;;        ;;        :features pycov2)

  )

(el-get 'sync my-packages)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name "~/.emacs-backups"))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; use ido for minibuffer completion
(require 'ido)
(ido-mode t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-show-dot-for-dired t)

;; default key to switch buffer is C-x b, but that's not easy enough
;;
;; when you do that, to kill emacs either close its frame from the window
;; manager or do M-x kill-emacs.  Don't need a nice shortcut for a once a
;; week (or day) action.
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x o") 'switch-window)

;; (global-set-key (kbd "M-n") 'next-error)
;; (global-set-key (kbd "M-p") 'previous-error)

;; C-u C-c SPC to go to non/any char
;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; (define-key global-map (kbd "<C-return>") 'ace-jump-mode)
;; (define-key global-map (kbd "<C-s-return>") 'ace-jump-mode)

(global-set-key (kbd "<C-return>") 'avy-goto-char)
(global-set-key (kbd "M-g g") 'avy-goto-line)

;; update avy keys to norman...
(setq avy-keys-alist
      `((avy-goto-char . (?t ?e ?s ?a ?n ?i))
        (avy-goto-word-1 . (?t ?e ?s ?a))))

;; web-mode
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)


;; guide-key
  (setq guide-key/guide-key-sequence t)


;; cider conf
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-print-length 100) ; the default is nil, no limit
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-to-list 'load-path "~/.emacs.d/el-get/cider")

;; grammar/spelling https://joelkuiper.eu/spellcheck_emacs
(when (executable-find "hunspell")
  (setq-default ispell-program-name "hunspell")
  (setq ispell-really-hunspell t))
(require 'langtool)
(setq langtool-language-tool-jar "/media/matt/29453c6c-2877-4c60-ba77-46b83d73d50b/home/matt/work/emacs/LanguageTool-2.7/languagetool-commandline.jar"
      ;; langtool-mother-tongue "nl"
      ;; langtool-disabled-rules '("WHITESPACE_RULE"
      ;;                           "EN_UNPAIRED_BRACKETS"
      ;;                           "COMMA_PARENTHESIS_WHITESPACE"
      ;;                           "EN_QUOTES")
)

(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
      "python -mjson.tool" (current-buffer) t)))

;; pretty print xml region
(defun pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    ;; split <foo><foo> or </foo><foo>, but not <foo></foo>
    (while (search-forward-regexp ">[ \t]*<[^/]" end t)
      (backward-char 2) (insert "\n") (incf end))
    ;; split <foo/></foo> and </foo></foo>
    (goto-char begin)
    (while (search-forward-regexp "<.*?/.*?>[ \t]*<" end t)
      (backward-char) (insert "\n") (incf end))
    (indent-region begin end nil)
    (normal-mode))
  (message "All indented!"))


(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)


(when (require 'yasnippet nil 'noerror)
  (progn
    (yas/load-directory "~/.emacs.d/el-get/clojure-snippets/snippets")))

;; disable C-z on X11 sessions
(when window-system
  (global-unset-key "\C-z"))

(setq matt-font-size 10)
(defun toggle-font-size (arg)
  "Toggle font size between 10 and 30 (or prefix variable)"
  (interactive "p")
  ;; make this use prefix arg someday...
  (message "raw prefix arg is %s" arg)
    (if (= matt-font-size 10)
        (setq matt-font-size 30)
      (setq matt-font-size 10))
      (set-default-font (format "Envy Code R-%d" matt-font-size))
      (redraw-display))
(global-set-key '[(f11)]  'toggle-font-size)

;; make maximise fill screen
(setq frame-resize-pixelwise t)

;; function keys
(global-set-key [f5] (lambda nil (interactive) (revert-buffer nil t t) (message (concat "Reverted buffer " (buffer-name)))))
(global-set-key [C-f6] 'bookmark-set)
(global-set-key [C-f7] 'bookmark-jump)
(global-set-key [C-f8] 'bookmark-bmenu-list)
(global-set-key [f12] (lambda () (interactive) (switch-to-buffer nil)))

;; change cursor on overwrite-mode
;; http://www.reddit.com/r/emacs/comments/ix6h8/what_do_you_guys_bind_your_functionkeypad_keys_to/
;; throws - Error: Wrong type argument: listp, 3
;; (setq default-cursor-type 'box)
;; (defadvice overwrite-mode (after overwrite-mode)
;;   (if overwrite-mode
;;       (setq cursor-type 'bar . 3)
;;     (setq cursor-type 'box)))
;; (ad-activate 'overwrite-mode)

;; get menu from 3rd mouse button
(global-set-key (kbd "<mouse-3>") 'mouse-major-mode-menu)
(global-set-key (kbd "<C-mouse-3>") 'mouse-popup-menubar)

(require 'guide-key)
(setq guide-key/guide-key-sequence t)


;; Avoid errors loading with flymake
(setq flymake-start-syntax-check-on-find-file nil)

;; show flymake problems in minibuffer
;; https://gist.github.com/415429
(defun my-flymake-show-help ()
   (when (get-char-property (point) 'flymake-overlay)
     (let ((help (get-char-property (point) 'help-echo)))
       (if help (message "%s" help)))))
(add-hook 'post-command-hook 'my-flymake-show-help)

;; ;; show flymake problems in minibuffer
;; ;; https://gist.github.com/415429
;; (defun my-flymake-show-help ()
;;    (when (get-char-property (point) 'flymake-overlay)
;;      (let ((help (get-char-property (point) 'help-echo)))
;;        (if help (message "%s" help)))))
;; (add-hook 'post-command-hook 'my-flymake-show-help)

;; Notes
;; C-x +  (balanced windows after split)

;; C-c left (undo) C-c right (redo)
(winner-mode t)

;; when I paste with mouse, do it at click (and not at point)
(setq mouse-yank-at-point nil)
(global-hl-line-mode 1)
(global-font-lock-mode 1)
(setq inhibit-splash-screen t)
(setq font-lock-maximum-decoration 3)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode 1)
(transient-mark-mode t)
(setq case-fold-search t)
(blink-cursor-mode 0)
(line-number-mode 1)
(column-number-mode 1)
;; scrolly stuff
;; http://emacs-fu.blogspot.com/2009/12/scrolling.html
(setq
 scroll-margin 0
 scroll-conservatively 100000
 scroll-preserve-screen-position 1)
;; scroll by line
(global-set-key (kbd "<M-up>") (lambda () (interactive) (scroll-down 1)))
(global-set-key (kbd "<M-down>") (lambda () (interactive) (scroll-up 1)))

(setq-default c-basic-offset 4)
;; for c indentation like this:
;; function
;; {
;;     bar
;; }
;; need
(setq-default c-basic-offset 4
	      tab-width 4
	      indent-tabs-mode nil)

;; make shift arrows move between windows
;; http://justinsboringpage.blogspot.com/2009/09/directional-window-movement-in-emacs.html
(windmove-default-keybindings)

;; window resizing http://www.emacswiki.org/emacs/WindowResize
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; make printer work - http://www.emacswiki.org/emacs/CupsInEmacs
(setq lpr-command "kprinter")

;; xml indent
(defun indent-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n")
      )
    (mark-whole-buffer)
    (indent-region begin end)
    ;(indent-region point-min point-max)
    )
  (message "Ah, much better!"))


(fset 'indent-xml
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217848 109 97 114 tab 45 119 tab 104 tab return 134217848 105 110 100 101 tab 45 120 109 tab return] 0 "%d")) arg)))
(global-set-key '[(f9)]  'indent-xml)

;; ;; bind M-n to next flymake error
;; ;; inspired by http://www.emacswiki.org/emacs/FlyMake comments
;; (defun matt-next-flymake-err ()
;;   (interactive)
;;   (flymake-goto-next-error)
;;   (let ((err (get-char-property (point) 'help-echo)))
;;     (when err
;;       (message err)))
;;   )
;; (defun matt-prev-flymake-err ()
;;   (interactive)
;;   (flymake-goto-prev-error)
;;   (let ((err (get-char-property (point) 'help-echo)))
;;     (when err
;;       (message err)))
;;   )

;; (global-set-key "\M-n" 'matt-next-flymake-err)
;; (global-set-key "\M-p" 'matt-prev-flymake-err)

;; if compilation-shell-minor-mode is on, then these regexes
;; will make errors linkable
;; thanks Gerard Brunick
(defun matt-add-global-compilation-errors (list)
  (dolist (x list)
    (add-to-list 'compilation-error-regexp-alist (car x))
    (setq compilation-error-regexp-alist-alist
          (cons x
                (assq-delete-all (car x)
                                 compilation-error-regexp-alist-alist)))))
;; (matt-add-global-compilation-errors
;;  `(
;;    (matt-python ,(concat "^ *File \\(\"?\\)\\([^,\" \n    <>]+\\)\\1"
;;                         ", lines? \\([0-9]+\\)-?\\([0-9]+\\)?")
;;                2 (3 . 4) nil 2 2)
;;    (matt-pdb-stack ,(concat "^>?[[:space:]]*\\(\\([-_./a-zA-Z0-9 ]+\\)"
;;                            "(\\([0-9]+\\))\\)"
;;                            "[_a-zA-Z0-9]+()[[:space:]]*->")
;;                   2 3 nil 0 1)
;;    (matt-python-unittest-err "^  File \"\\([-_./a-zA-Z0-9 ]+\\)\", line \\([0-9]+\\).*" 1 2)
;;    )
;; ;; We rule out filenames starting with < as these aren't files.
;; ;; (pdb "^> *\\([^(< ][^(]*\\)(\\([0-9]+\\))" 1 2)
;; )

(defun matt-set-local-compilation-errors (errors)
  "Set the buffer local compilation errors.

Ensures than any symbols given are defined in
compilation-error-regexp-alist-alist."
  (dolist (e errors)
    (when (symbolp e)
      (unless (assoc e compilation-error-regexp-alist-alist)
        (error (concat "Error %s is not listed in "
                       "compilation-error-regexp-alist-alist")
               e))))
  (set (make-local-variable 'compilation-error-regexp-alist)
       errors))

(add-hook 'shell-mode-hook (lambda () (compilation-shell-minor-mode)))

;; from dimitri fontaine's blog
;; C-c . in org-mode
(defun insert-date ()
  "Insert a time-stamp according to locale's date and time format.\"
(interactive)
(insert (format-time-string "%a, %e %b %Y, %k:%M" (current-time)))'")

(defun darkroom-mode ()
        "Make things simple-looking by removing decoration
and choosing a simple theme."
        (interactive)
        (setq left-margin 10)
        (menu-bar-mode -1)
        (tool-bar-mode -1)
        (scroll-bar-mode -1)
        ;;(border-width . 0)
        ;;(internal-border-width . 64)
        (auto-fill-mode 1))
;; need to toggle

;;
;; Use archive mode to open Python eggs
(add-to-list 'auto-mode-alist '("\\.egg\\'" . archive-mode))
(add-to-list 'auto-mode-alist '("\\.odp\\'" . archive-mode))
(add-to-list 'auto-mode-alist '("\\.otp\\'" . archive-mode))
;; also for .xo files (zip)
(add-to-list 'auto-mode-alist '("\\.xo\\'" . archive-mode))
;; google gadget
(add-to-list 'auto-mode-alist '("\\.gg\\'" . archive-mode))
;; java
(add-to-list 'auto-mode-alist '("\\.war\\'" . archive-mode))
(add-to-list 'auto-mode-alist '("\\.jar\\'" . archive-mode))
;;
(add-to-list 'auto-mode-alist '("\\.epub\\'" . archive-mode))

;; (add-to-list 'load-path "~/.emacs.d/el-get/python")
;; (require 'python)


;; https://www.bunkus.org/blog/2009/12/switching-identifier-naming-style-between-camel-case-and-c-style-in-emacs/
(defun mo-toggle-identifier-naming-style ()
  "Toggles the symbol at point between C-style naming,
    e.g. `hello_world_string', and camel case,
    e.g. `HelloWorldString'."
  (interactive)
  (let* ((symbol-pos (bounds-of-thing-at-point 'symbol))
	 case-fold-search symbol-at-point cstyle regexp func)
    (unless symbol-pos
      (error "No symbol at point"))
    (save-excursion
      (narrow-to-region (car symbol-pos) (cdr symbol-pos))
      (setq cstyle (string-match-p "_" (buffer-string))
	    regexp (if cstyle "\\(?:\\_<\\|_\\)\\(\\w\\)" "\\([A-Z]\\)")
	    func (if cstyle
		     'capitalize
		   (lambda (s)
		     (concat (if (= (match-beginning 1)
				    (car symbol-pos))
				 ""
			       "_")
			     (downcase s)))))
      (goto-char (point-min))
      (while (re-search-forward regexp nil t)
	(replace-match (funcall func (match-string 1))
		       t nil))
      (widen))))

;; https://gist.github.com/1475626
(defun nkv/pdb-here (pos)
  (interactive "d")
  (let (
        (trace-command "import pdb; pdb.set_trace()"))
    (save-excursion
      (save-restriction
        (widen)
        (goto-char (point-min))
        (search-forward trace-command nil t)
        (beginning-of-line)
        (kill-line 1)))
    (beginning-of-line)
    (insert (concat trace-command "\n"))
    (forward-line -1)
    (indent-for-tab-command)))

(defun pdb-here ()
  (interactive)
  (insert "import pdb; pdb.set_trace()"))

;; from https://github.com/nflath/emacs-repos/blob/master/internal/python.el
(defun python-insert-end-dunder ()
  "Appends __ to the current word if it started with __."
  (interactive)
  (save-excursion
    (let ((cur (point)))
      (search-backward-regexp "[
\t .(-]\\|^" 0 t)
      (if (not (looking-at "^"))
          (forward-char 1))
      (if (looking-at "\\s\__")
          (setq my-temp-var t)
        (setq my-temp-var nil))))
  (save-excursion
    (when (> (point) 2)
      (backward-char 2)
      (if (looking-at "__")
          (setq my-temp-var nil))))
  (if my-temp-var (insert "__"))
  (self-insert-command 1))

(defun python-insert-start-self ()
  "Insert self. at the beginning of the current word."
  (interactive)
  (save-excursion
    (search-backward-regexp
     "[
 \t,(-]\\|^")
    (if (not (looking-at "^"))
        (forward-char))
    (insert "self.")))

(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil
                  tab-width 2)
            (idle-highlight-mode t)
            (define-key         python-mode-map (kbd "C-c C-b") 'nkv/stop-here)
            (define-key         python-mode-map (kbd ".")       'python-insert-end-dunder)
            (define-key         python-mode-map (kbd "SPC")     'python-insert-end-dunder)
            (define-key         python-mode-map (kbd "(")       'python-insert-end-dunder)
            (define-key         python-mode-map         (kbd "C-;")     'python-insert-start-self)))

(defun virtualenv-activate (directory)
"Activate a venv directory (without virtualenv-wrapper)"
(interactive "DVirtualenv directory")
(let* ((virtualenv-workon-session (file-name-nondirectory (directory-file-name directory)))
      (virtualenv-root (file-name-directory (directory-file-name directory))))
      (virtualenv-workon)))

(defun python-venv-activate (directory)
  "Activate new python.el virtualenv"
  (interactive "DDirectory:")
  (let ((bin-dir (format "%sbin" directory)))
    (message directory)
    (message bin-dir)
    (setq python-shell-process-environment
          (list
           (format "PATH=%s" (mapconcat
                              'identity
                              (reverse
                               (cons (getenv "PATH")
                                     (list bin-dir)))
                              ":"))
           (format "VIRTUAL_ENV=%s" directory)))
    (setq python-shell-exec-path (list bin-dir))))

;; make backward delete whitespace hungry
;; (custom-set-variables
;;  '(backward-delete-char-untabify-method 'all))
;; use M-\ for forward hungry delete

;; Kill trailing whitespace
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; centralize backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;;
;; kill ping while C-x C-f (emacs-starter-kit issue #39)
(setq ffap-machine-p-known 'reject)


;; starter-kit copies
(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'ansi-color)
(require 'recentf)

;; tango shell
;; http://tapoueh.org/blog/2011/07/29-emacs-ansi-colors.html
(setq ansi-color-names-vector
         (vector (frame-parameter nil 'background-color)
               "#f57900" "#8ae234" "#edd400" "#729fcf"
               "#ad7fa8" "cyan3" "#eeeeec")
         ansi-term-color-vector ansi-color-names-vector
         ansi-color-map (ansi-color-make-color-map))


;; make shell colors work
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; http://emacs-fu.blogspot.com/2009/11/making-buffer-names-unique.html
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")


;; replace elisp with contents
;; http://stackoverflow.com/questions/3035337/in-emacs-can-you-evaluate-an-elisp-expression-and-replace-it-with-the-result
(defun replace-last-sexp ()
  (interactive)
  (let ((value (eval (preceding-sexp))))
    (kill-sexp -1)
    (insert (format "%s" value))))

;; coda swap  http://en.myfreeweb.ru/coda-like-swapping-in-emacs
(defun coda-swap (expr)
  (interactive "sExpr: ")
  (query-replace-regexp
   (replace-regexp-in-string "$[1-2]" "\\\\([0-9a-zA-Z]*\\\\)" expr)
   (replace-regexp-in-string "$[1-2]" (lambda (m) (if (equal m "$1") "\\\\2" "\\\\1")) expr)))

;; Example:
; enter
; width="$1" height="$2"
; and it will replace
; width="240" height="320"
; with
; width="320" height="240"

;; C-x C-+ is normal
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-=") 'text-scale-increase)
;; (global-set-key (kbd "C--") (lambda () (interactive) (text-scale-adjust -1)))
(global-set-key (kbd "C--") 'text-scale-decrease)

;; process to save a keyboard macro
;; record it using f3 and f4 (to signal start/stop)
;; C-x C-k n  Give a command name (for the duration of the Emacs session) to the most recently defined keyboard macro (kmacro-name-last-macro).
;;  M-x insert-kbd-macro <RET> macroname <RET>
;; not used but here for example
(fset 'rerun-pdb
      (lambda (&optional arg)
        "Goto next window.  Kill pdb (gud).  Start pdb and hit
        the c character to
        continue" (interactive "p") (kmacro-exec-ring-item (quote ([24
        111 24 98 103 117 100 return 24 107 return 134217848 112
        100 98 return return 99 return] 0 "%d")) arg)))


;; bind it to f11
;;(global-set-key '[(f11)]  'rerun-pdb)



;; from https://github.com/myfreeweb/emacs/blob/master/useful-stuff.el
;;; FIXME/TODO/BUG/XXX highlight
(defun markers-hl ()
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME\\|TODO\\|BUG\\|XXX\\):" 1 font-lock-warning-face t))))
(add-hook 'python-mode-hook 'markers-hl)
(add-hook 'ruby-mode-hook 'markers-hl)
(add-hook 'perl-mode-hook 'markers-hl)
(add-hook 'js-mode-hook 'markers-hl)
(add-hook 'css-mode-hook 'markers-hl)
(add-hook 'coffee-mode-hook 'markers-hl)
(add-hook 'nxml-mode-hook 'markers-hl)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; shell customizations - http://snarfed.org/why_i_run_shells_inside_emacs
;;
;; (defvar my-shells
;;   '("*matt*" "*shell0*" "*shell1*" "*shell2*" "*music*"))

;; (custom-set-variables
;;  '(tramp-default-method "ssh")          ; uses ControlMaster
;;  '(comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
;;  '(comint-scroll-to-bottom-on-output nil) ; always add output at the bottom
;;  '(comint-scroll-show-maximum-output t) ; scroll to show max possible output
;;  ;; '(comint-completion-autolist t)     ; show completion list when ambiguous
;;  '(comint-input-ignoredups t)           ; no duplicates in command history
;;  '(comint-completion-addsuffix t)       ; insert space/slash after file completion
;;  '(comint-buffer-maximum-size 100000)   ; max length of the buffer in lines
;;  '(comint-prompt-read-only nil)         ; if this is t, it breaks shell-command
;;  '(comint-get-old-input (lambda () "")) ; what to run when i press enter on a
;;                                         ; line above the current prompt
;;  '(comint-input-ring-size 5000)         ; max shell history size
;;  '(protect-buffer-bury-p nil)
;; )

;; (setenv "PAGER" "cat")

;; ;; truncate buffers continuously
;; (add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

;; (defun make-my-shell-output-read-only (text)
;;   "Add to comint-output-filter-functions to make stdout read only in my shells."
;;   (if (member (buffer-name) my-shells)
;;       (let ((inhibit-read-only t)
;;             (output-end (process-mark (get-buffer-process (current-buffer)))))
;;         (put-text-property comint-last-output-start output-end 'read-only t))))
;; (add-hook 'comint-output-filter-functions 'make-my-shell-output-read-only)

;; (defun dirtrack-mode-locally ()
;;   "Add to shell-mode-hook to use dirtrack mode in my local shell buffers."
;;   (when (member (buffer-name) (cdr my-shells))
;;     (dirtrack-mode t)
;;     (set-variable 'dirtrack-list '("^[A-Za-z0-9]+:\\([~/][^\\n>]*\\)>" 1 nil))))
;; (add-hook 'shell-mode-hook 'dirtrack-mode-locally)

;; ; interpret and use ansi color codes in shell output windows
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; (defun set-scroll-conservatively ()
;;   "Add to shell-mode-hook to prevent jump-scrolling on newlines in shell buffers."
;;   (set (make-local-variable 'scroll-conservatively) 10))
;; (add-hook 'shell-mode-hook 'set-scroll-conservatively)

;; (defun unset-display-buffer-reuse-frames ()
;;   "Add to shell-mode-hook to prevent switching away from the shell buffer
;; when emacsclient opens a new buffer."
;;   (set (make-local-variable 'display-buffer-reuse-frames) t))
;; (add-hook 'shell-mode-hook 'unset-display-buffer-reuse-frames)

;; ;; make it harder to kill my shell buffers
;; (require 'protbuf)
;; (add-hook 'shell-mode-hook 'protect-buffer-from-kill-mode)

;; (defun make-comint-directory-tracking-work-remotely ()
;;   "Add this to comint-mode-hook to make directory tracking work
;; while sshed into a remote host, e.g. for remote shell buffers
;; started in tramp. (This is a bug fix backported from Emacs 24:
;; http://comments.gmane.org/gmane.emacs.bugs/39082"
;;   (set (make-local-variable 'comint-file-name-prefix)
;;        (or (file-remote-p default-directory) "")))
;; (add-hook 'comint-mode-hook 'make-comint-directory-tracking-work-remotely)

;; (defun comint-close-completions ()
;;   "Close close the comint completions buffer.
;; Used in advice to various comint functions to automatically close
;; the completions buffer as soon as I'm done with it. Based on
;; Dmitriy Igrishin <dmitigr@gmail.com>'s patched version of
;; comint.el."
;;   (if comint-dynamic-list-completions-config
;;       (progn
;;         (set-window-configuration comint-dynamic-list-completions-config)
;;         (setq comint-dynamic-list-completions-config nil))))

;; (defadvice comint-send-input (after close-completions activate)
;;   (comint-close-completions))

;; (defadvice comint-dynamic-complete-as-filename (after close-completions activate)
;;   (if ad-return-value (comint-close-completions)))

;; (defadvice comint-dynamic-simple-complete (after close-completions activate)
;;   (if (member ad-return-value '('sole 'shortest 'partial))
;;       (comint-close-completions)))

;; (defadvice comint-dynamic-list-completions (after close-completions activate)
;;     (comint-close-completions)
;;     (if (not unread-command-events)
;;         ;; comint's "Type space to flush" swallows space. put it back in.
;;         (setq unread-command-events (listify-key-sequence " "))))

;; (defun enter-again-if-enter ()
;;   "Make the return key select the current item in minibuf and shell history isearch.
;; An alternate approach would be after-advice on isearch-other-meta-char."
;;   (when (and (not isearch-mode-end-hook-quit)
;;              (equal (this-command-keys-vector) [13])) ; == return
;;     (cond ((active-minibuffer-window) (minibuffer-complete-and-exit))
;;           ((member (buffer-name) my-shells) (comint-send-input)))))
;; (add-hook 'isearch-mode-end-hook 'enter-again-if-enter)

;; (defadvice comint-previous-matching-input
;;     (around suppress-history-item-messages activate)
;;   "Suppress the annoying 'History item : NNN' messages from shell history isearch.
;; If this isn't enough, try the same thing with
;; comint-replace-by-expanded-history-before-point."
;;   (let ((old-message (symbol-function 'message)))
;;     (unwind-protect
;;       (progn (fset 'message 'ignore) ad-do-it)
;;     (fset 'message old-message))))



(put 'ido-exit-minibuffer 'disabled nil)

(put 'narrow-to-region 'disabled nil)


;; helm stuff http://tuhdo.github.io/helm-intro.html
(require 'helm)
(require 'helm-config)
(require 'helm-eshell)
(require 'helm-files)
(require 'wgrep-helm)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(eval-after-load 'helm-grep
  '(progn
     (define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
     (define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
     (define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)))

(setq
 helm-google-suggest-use-curl-p t
 helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
 helm-quick-update t ; do not display invisible candidates
 helm-idle-delay 0.01 ; be idle for this many seconds, before updating in delayed sources.
 helm-input-idle-delay 0.01 ; be idle for this many seconds, before updating candidate buffer
 helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.

 ;; you can customize helm-do-grep to execute ack-grep
 ;; helm-grep-default-command "ack-grep -Hn --smart-case --no-group --no-color %e %p %f"
 ;; helm-grep-default-recurse-command "ack-grep -H --smart-case --no-group --no-color %e %p %f"
 helm-split-window-default-side 'other ;; open helm buffer in another window
 helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
 helm-buffers-favorite-modes (append helm-buffers-favorite-modes
                                     '(picture-mode artist-mode))
 helm-candidate-number-limit 200 ; limit the number of displayed canidates
 helm-M-x-requires-pattern 0     ; show all candidates when set to 0
 helm-boring-file-regexp-list
 '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "\\.i$") ; do not show these files in helm buffer
 helm-ff-file-name-history-use-recentf t
 helm-move-to-line-cycle-in-source t ; move to end or beginning of source
                                        ; when reaching top or bottom of source.
 ido-use-virtual-buffers t      ; Needed in helm-buffers-list
 helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non--nil
                                        ; useful in helm-mini that lists buffers
 )

(define-key helm-map (kbd "C-x 2") 'helm-select-2nd-action)
(define-key helm-map (kbd "C-x 3") 'helm-select-3rd-action)
(define-key helm-map (kbd "C-x 4") 'helm-select-4rd-action)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h m") 'helm-man-woman)
(global-set-key (kbd "C-c h g") 'helm-do-grep)
(global-set-key (kbd "C-c h f") 'helm-find)
(global-set-key (kbd "C-c h l") 'helm-locate)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-h C-f") 'helm-apropos)

;; use helm to list eshell history
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

;; (helm-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("1bb9af3baf150cc362bdd1267abc199a6c3975357cfcf57550cbc63df1823265" default))))

(setq pycov2-cov2emacs-cmd "PYTHONPATH=~/.env/lib/python2.7/site-packages:~/.emacs.d/el-get/pycoverage.el/cov2emacs ~/.emacs.d/el-get/pycoverage.el/cov2emacs/bin/cov2emacs")
