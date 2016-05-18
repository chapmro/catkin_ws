; Auto-generated. Do not edit!


(cl:in-package au_uav_ros-srv)


;//! \htmlinclude Centralize-request.msg.html

(cl:defclass <Centralize-request> (roslisp-msg-protocol:ros-message)
  ((centralize
    :reader centralize
    :initarg :centralize
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Centralize-request (<Centralize-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Centralize-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Centralize-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<Centralize-request> is deprecated: use au_uav_ros-srv:Centralize-request instead.")))

(cl:ensure-generic-function 'centralize-val :lambda-list '(m))
(cl:defmethod centralize-val ((m <Centralize-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:centralize-val is deprecated.  Use au_uav_ros-srv:centralize instead.")
  (centralize m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Centralize-request>) ostream)
  "Serializes a message object of type '<Centralize-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'centralize) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Centralize-request>) istream)
  "Deserializes a message object of type '<Centralize-request>"
    (cl:setf (cl:slot-value msg 'centralize) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Centralize-request>)))
  "Returns string type for a service object of type '<Centralize-request>"
  "au_uav_ros/CentralizeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Centralize-request)))
  "Returns string type for a service object of type 'Centralize-request"
  "au_uav_ros/CentralizeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Centralize-request>)))
  "Returns md5sum for a message object of type '<Centralize-request>"
  "2e4979c419953a1119dbb5518ec67346")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Centralize-request)))
  "Returns md5sum for a message object of type 'Centralize-request"
  "2e4979c419953a1119dbb5518ec67346")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Centralize-request>)))
  "Returns full string definition for message of type '<Centralize-request>"
  (cl:format cl:nil "bool centralize~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Centralize-request)))
  "Returns full string definition for message of type 'Centralize-request"
  (cl:format cl:nil "bool centralize~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Centralize-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Centralize-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Centralize-request
    (cl:cons ':centralize (centralize msg))
))
;//! \htmlinclude Centralize-response.msg.html

(cl:defclass <Centralize-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:string
    :initform ""))
)

(cl:defclass Centralize-response (<Centralize-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Centralize-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Centralize-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<Centralize-response> is deprecated: use au_uav_ros-srv:Centralize-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <Centralize-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:error-val is deprecated.  Use au_uav_ros-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Centralize-response>) ostream)
  "Serializes a message object of type '<Centralize-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Centralize-response>) istream)
  "Deserializes a message object of type '<Centralize-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Centralize-response>)))
  "Returns string type for a service object of type '<Centralize-response>"
  "au_uav_ros/CentralizeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Centralize-response)))
  "Returns string type for a service object of type 'Centralize-response"
  "au_uav_ros/CentralizeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Centralize-response>)))
  "Returns md5sum for a message object of type '<Centralize-response>"
  "2e4979c419953a1119dbb5518ec67346")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Centralize-response)))
  "Returns md5sum for a message object of type 'Centralize-response"
  "2e4979c419953a1119dbb5518ec67346")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Centralize-response>)))
  "Returns full string definition for message of type '<Centralize-response>"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Centralize-response)))
  "Returns full string definition for message of type 'Centralize-response"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Centralize-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Centralize-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Centralize-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Centralize)))
  'Centralize-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Centralize)))
  'Centralize-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Centralize)))
  "Returns string type for a service object of type '<Centralize>"
  "au_uav_ros/Centralize")