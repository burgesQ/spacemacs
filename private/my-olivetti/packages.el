;;; packages.el --- my-olivetti layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2020 Sylvain Benner & Contributors
;;
;; Author: master <master@yopihip>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `my-olivetti-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-olivetti/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-olivetti/pre-init-PACKAGE' and/or
;;   `my-olivetti/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-olivetti-packages
  '(olivetti))

(defun my-olivetti/init-olivetti ()
  (use-package olivetti))

;;; packages.el ends here
