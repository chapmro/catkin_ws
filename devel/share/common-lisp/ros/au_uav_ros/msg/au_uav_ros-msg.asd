
(cl:in-package :asdf)

(defsystem "au_uav_ros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Command" :depends-on ("_package_Command"))
    (:file "_package_Command" :depends-on ("_package"))
    (:file "Telemetry" :depends-on ("_package_Telemetry"))
    (:file "_package_Telemetry" :depends-on ("_package"))
    (:file "TelemetryUpdate" :depends-on ("_package_TelemetryUpdate"))
    (:file "_package_TelemetryUpdate" :depends-on ("_package"))
  ))