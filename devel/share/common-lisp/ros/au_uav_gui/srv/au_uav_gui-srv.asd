
(cl:in-package :asdf)

(defsystem "au_uav_gui-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SendFilePath" :depends-on ("_package_SendFilePath"))
    (:file "_package_SendFilePath" :depends-on ("_package"))
  ))