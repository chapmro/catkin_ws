; Auto-generated. Do not edit!


(cl:in-package au_uav_ros-srv)


;//! \htmlinclude CloseComms-request.msg.html

(cl:defclass <CloseComms-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass CloseComms-request (<CloseComms-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CloseComms-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CloseComms-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<CloseComms-request> is deprecated: use au_uav_ros-srv:CloseComms-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CloseComms-request>) ostream)
  "Serializes a message object of type '<CloseComms-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CloseComms-request>) istream)
  "Deserializes a message object of type '<CloseComms-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CloseComms-request>)))
  "Returns string type for a service object of type '<CloseComms-request>"
  "au_uav_ros/CloseCommsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CloseComms-request)))
  "Returns string type for a service object of type 'CloseComms-request"
  "au_uav_ros/CloseCommsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CloseComms-request>)))
  "Returns md5sum for a message object of type '<CloseComms-request>"
  "eca8b96616c32aacf1be8bbf14c70eba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CloseComms-request)))
  "Returns md5sum for a message object of type 'CloseComms-request"
  "eca8b96616c32aacf1be8bbf14c70eba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CloseComms-request>)))
  "Returns full string definition for message of type '<CloseComms-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CloseComms-request)))
  "Returns full string definition for message of type 'CloseComms-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CloseComms-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CloseComms-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CloseComms-request
))
;//! \htmlinclude CloseComms-response.msg.html

(cl:defclass <CloseComms-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:string
    :initform ""))
)

(cl:defclass CloseComms-response (<CloseComms-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CloseComms-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CloseComms-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<CloseComms-response> is deprecated: use au_uav_ros-srv:CloseComms-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <CloseComms-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:error-val is deprecated.  Use au_uav_ros-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CloseComms-response>) ostream)
  "Serializes a message object of type '<CloseComms-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CloseComms-response>) istream)
  "Deserializes a message object of type '<CloseComms-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CloseComms-response>)))
  "Returns string type for a service object of type '<CloseComms-response>"
  "au_uav_ros/CloseCommsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CloseComms-response)))
  "Returns string type for a service object of type 'CloseComms-response"
  "au_uav_ros/CloseCommsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CloseComms-response>)))
  "Returns md5sum for a message object of type '<CloseComms-response>"
  "eca8b96616c32aacf1be8bbf14c70eba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CloseComms-response)))
  "Returns md5sum for a message object of type 'CloseComms-response"
  "eca8b96616c32aacf1be8bbf14c70eba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CloseComms-response>)))
  "Returns full string definition for message of type '<CloseComms-response>"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CloseComms-response)))
  "Returns full string definition for message of type 'CloseComms-response"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CloseComms-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CloseComms-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CloseComms-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CloseComms)))
  'CloseComms-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CloseComms)))
  'CloseComms-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CloseComms)))
  "Returns string type for a service object of type '<CloseComms>"
  "au_uav_ros/CloseComms")