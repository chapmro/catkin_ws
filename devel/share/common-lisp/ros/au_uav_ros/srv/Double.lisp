; Auto-generated. Do not edit!


(cl:in-package au_uav_ros-srv)


;//! \htmlinclude Double-request.msg.html

(cl:defclass <Double-request> (roslisp-msg-protocol:ros-message)
  ((val
    :reader val
    :initarg :val
    :type cl:float
    :initform 0.0))
)

(cl:defclass Double-request (<Double-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Double-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Double-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<Double-request> is deprecated: use au_uav_ros-srv:Double-request instead.")))

(cl:ensure-generic-function 'val-val :lambda-list '(m))
(cl:defmethod val-val ((m <Double-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:val-val is deprecated.  Use au_uav_ros-srv:val instead.")
  (val m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Double-request>) ostream)
  "Serializes a message object of type '<Double-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'val))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Double-request>) istream)
  "Deserializes a message object of type '<Double-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'val) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Double-request>)))
  "Returns string type for a service object of type '<Double-request>"
  "au_uav_ros/DoubleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Double-request)))
  "Returns string type for a service object of type 'Double-request"
  "au_uav_ros/DoubleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Double-request>)))
  "Returns md5sum for a message object of type '<Double-request>"
  "e58306843647ad689bd8b6b76c7fdf60")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Double-request)))
  "Returns md5sum for a message object of type 'Double-request"
  "e58306843647ad689bd8b6b76c7fdf60")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Double-request>)))
  "Returns full string definition for message of type '<Double-request>"
  (cl:format cl:nil "float64 val~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Double-request)))
  "Returns full string definition for message of type 'Double-request"
  (cl:format cl:nil "float64 val~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Double-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Double-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Double-request
    (cl:cons ':val (val msg))
))
;//! \htmlinclude Double-response.msg.html

(cl:defclass <Double-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:string
    :initform ""))
)

(cl:defclass Double-response (<Double-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Double-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Double-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<Double-response> is deprecated: use au_uav_ros-srv:Double-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <Double-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:error-val is deprecated.  Use au_uav_ros-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Double-response>) ostream)
  "Serializes a message object of type '<Double-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Double-response>) istream)
  "Deserializes a message object of type '<Double-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'error) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Double-response>)))
  "Returns string type for a service object of type '<Double-response>"
  "au_uav_ros/DoubleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Double-response)))
  "Returns string type for a service object of type 'Double-response"
  "au_uav_ros/DoubleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Double-response>)))
  "Returns md5sum for a message object of type '<Double-response>"
  "e58306843647ad689bd8b6b76c7fdf60")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Double-response)))
  "Returns md5sum for a message object of type 'Double-response"
  "e58306843647ad689bd8b6b76c7fdf60")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Double-response>)))
  "Returns full string definition for message of type '<Double-response>"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Double-response)))
  "Returns full string definition for message of type 'Double-response"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Double-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Double-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Double-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Double)))
  'Double-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Double)))
  'Double-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Double)))
  "Returns string type for a service object of type '<Double>"
  "au_uav_ros/Double")