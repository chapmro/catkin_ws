; Auto-generated. Do not edit!


(cl:in-package au_uav_ros-srv)


;//! \htmlinclude ExitCommand-request.msg.html

(cl:defclass <ExitCommand-request> (roslisp-msg-protocol:ros-message)
  ((ids
    :reader ids
    :initarg :ids
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass ExitCommand-request (<ExitCommand-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExitCommand-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExitCommand-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<ExitCommand-request> is deprecated: use au_uav_ros-srv:ExitCommand-request instead.")))

(cl:ensure-generic-function 'ids-val :lambda-list '(m))
(cl:defmethod ids-val ((m <ExitCommand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:ids-val is deprecated.  Use au_uav_ros-srv:ids instead.")
  (ids m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExitCommand-request>) ostream)
  "Serializes a message object of type '<ExitCommand-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ids))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'ids))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExitCommand-request>) istream)
  "Deserializes a message object of type '<ExitCommand-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ids)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExitCommand-request>)))
  "Returns string type for a service object of type '<ExitCommand-request>"
  "au_uav_ros/ExitCommandRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExitCommand-request)))
  "Returns string type for a service object of type 'ExitCommand-request"
  "au_uav_ros/ExitCommandRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExitCommand-request>)))
  "Returns md5sum for a message object of type '<ExitCommand-request>"
  "013a5047a27160a1a3446df81f760177")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExitCommand-request)))
  "Returns md5sum for a message object of type 'ExitCommand-request"
  "013a5047a27160a1a3446df81f760177")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExitCommand-request>)))
  "Returns full string definition for message of type '<ExitCommand-request>"
  (cl:format cl:nil "int16[] ids~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExitCommand-request)))
  "Returns full string definition for message of type 'ExitCommand-request"
  (cl:format cl:nil "int16[] ids~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExitCommand-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExitCommand-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ExitCommand-request
    (cl:cons ':ids (ids msg))
))
;//! \htmlinclude ExitCommand-response.msg.html

(cl:defclass <ExitCommand-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ExitCommand-response (<ExitCommand-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExitCommand-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExitCommand-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<ExitCommand-response> is deprecated: use au_uav_ros-srv:ExitCommand-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExitCommand-response>) ostream)
  "Serializes a message object of type '<ExitCommand-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExitCommand-response>) istream)
  "Deserializes a message object of type '<ExitCommand-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExitCommand-response>)))
  "Returns string type for a service object of type '<ExitCommand-response>"
  "au_uav_ros/ExitCommandResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExitCommand-response)))
  "Returns string type for a service object of type 'ExitCommand-response"
  "au_uav_ros/ExitCommandResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExitCommand-response>)))
  "Returns md5sum for a message object of type '<ExitCommand-response>"
  "013a5047a27160a1a3446df81f760177")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExitCommand-response)))
  "Returns md5sum for a message object of type 'ExitCommand-response"
  "013a5047a27160a1a3446df81f760177")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExitCommand-response>)))
  "Returns full string definition for message of type '<ExitCommand-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExitCommand-response)))
  "Returns full string definition for message of type 'ExitCommand-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExitCommand-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExitCommand-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ExitCommand-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ExitCommand)))
  'ExitCommand-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ExitCommand)))
  'ExitCommand-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExitCommand)))
  "Returns string type for a service object of type '<ExitCommand>"
  "au_uav_ros/ExitCommand")