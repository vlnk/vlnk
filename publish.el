;;; publish.el --- Publish my web identity
;;; Author: vlnk <vlnk@protonmail.com>

;;; Local Variables:
;;; End:

;;; Commentary:
;;; - https://github.com/emacs-mirror/emacs/blob/master/lisp/org/ox-publish.el
;;; - https://git.sr.ht/~bzg/org-mode/tree/main/item/lisp/ox-md.el

;;; Code:
(require 'ox-publish)

(setq org-publish-project-alist
  '(("cv-md-en"
      :base-directory "."
      :include ("Curriculum.org")
      :publishing-directory "public/en"
      :body-only t
      :with-title nil
      :headline-levels 3
      :select-tags ("en")
      :publishing-function org-md-publish-to-md)
     ("cv-html-en"
       :base-directory "."
       :include ("Curriculum.org")
       :publishing-directory "public/en"
       :body-only t
       :section-numbers nil
       :with-title nil
       :headline-levels 3
       :select-tags ("en")
       :publishing-function org-html-publish-to-html)
     ("cv"
       :components ("cv-md-en" "cv-html-en"))))

(defun me/publish ()
  "Publish the web component with org-publish."
  (delete-file "README.md")
  (org-publish "cv" t)
  (copy-file "public/en/Curriculum.md" "README.md" t))

;;; publish.el ends here
