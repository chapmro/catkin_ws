; Auto-generated. Do not edit!


(cl:in-package au_uav_ros-srv)


;//! \htmlinclude InitComms-request.msg.html

(cl:defclass <InitComms-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass InitComms-request (<InitComms-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InitComms-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InitComms-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<InitComms-request> is deprecated: use au_uav_ros-srv:InitComms-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InitComms-request>) ostream)
  "Serializes a message object of type '<InitComms-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InitComms-request>) istream)
  "Deserializes a message object of type '<InitComms-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InitComms-request>)))
  "Returns string type for a service object of type '<InitComms-request>"
  "au_uav_ros/InitCommsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InitComms-request)))
  "Returns string type for a service object of type 'InitComms-request"
  "au_uav_ros/InitCommsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InitComms-request>)))
  "Returns md5sum for a message object of type '<InitComms-request>"
  "eca8b96616c32aacf1be8bbf14c70eba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InitComms-request)))
  "Returns md5sum for a message object of type 'InitComms-request"
  "eca8b96616c32aacf1be8bbf14c70eba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InitComms-request>)))
  "Returns full string definition for message of type '<InitComms-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InitComms-request)))
  "Returns full string definition for message of type 'InitComms-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InitComms-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InitComms-request>))
  "Converts a ROS message object to a list"
  (cl:list 'InitComms-request
))
;//! \htmlinclude InitComms-response.msg.html

(cl:defclass <InitComms-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:string
    :initform ""))
)

(cl:defclass InitComms-response (<InitComms-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InitComms-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InitComms-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<InitComms-response> is deprecated: use au_uav_ros-srv:InitComms-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <InitComms-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:error-val is deprecated.  Use au_uav_ros-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InitComms-response>) ostream)
  "Serializes a message object of type '<InitComms-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InitComms-response>) istream)
  "Deserializes a message object of type '<InitComms-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InitComms-response>)))
  "Returns string type for a service object of type '<InitComms-response>"
  "au_uav_ros/InitCommsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InitComms-response)))
  "Returns string type for a service object of type 'InitComms-response"
  "au_uav_ros/InitCommsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InitComms-response>)))
  "Returns md5sum for a message object of type '<InitComms-response>"
  "eca8b96616c32aacf1be8bbf14c70eba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InitComms-response)))
  "Returns md5sum for a message object of type 'InitComms-response"
  "eca8b96616c32aacf1be8bbf14c70eba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InitComms-response>)))
  "Returns full string definition for message of type '<InitComms-response>"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InitComms-response)))
  "Returns full string definition for message of type 'InitComms-response"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InitComms-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InitComms-response>))
  "Converts a ROS message object to a list"
  (cl:list 'InitComms-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'InitComms)))
  'InitComms-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'InitComms)))
  'InitComms-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InitComms)))
  "Returns string type for a service object of type '<InitComms>"
  "au_uav_ros/InitComms")