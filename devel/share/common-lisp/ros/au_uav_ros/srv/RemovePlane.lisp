; Auto-generated. Do not edit!


(cl:in-package au_uav_ros-srv)


;//! \htmlinclude RemovePlane-request.msg.html

(cl:defclass <RemovePlane-request> (roslisp-msg-protocol:ros-message)
  ((sim
    :reader sim
    :initarg :sim
    :type cl:boolean
    :initform cl:nil)
   (planeID
    :reader planeID
    :initarg :planeID
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RemovePlane-request (<RemovePlane-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RemovePlane-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RemovePlane-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<RemovePlane-request> is deprecated: use au_uav_ros-srv:RemovePlane-request instead.")))

(cl:ensure-generic-function 'sim-val :lambda-list '(m))
(cl:defmethod sim-val ((m <RemovePlane-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:sim-val is deprecated.  Use au_uav_ros-srv:sim instead.")
  (sim m))

(cl:ensure-generic-function 'planeID-val :lambda-list '(m))
(cl:defmethod planeID-val ((m <RemovePlane-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:planeID-val is deprecated.  Use au_uav_ros-srv:planeID instead.")
  (planeID m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RemovePlane-request>) ostream)
  "Serializes a message object of type '<RemovePlane-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'sim) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'planeID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RemovePlane-request>) istream)
  "Deserializes a message object of type '<RemovePlane-request>"
    (cl:setf (cl:slot-value msg 'sim) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'planeID) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RemovePlane-request>)))
  "Returns string type for a service object of type '<RemovePlane-request>"
  "au_uav_ros/RemovePlaneRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RemovePlane-request)))
  "Returns string type for a service object of type 'RemovePlane-request"
  "au_uav_ros/RemovePlaneRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RemovePlane-request>)))
  "Returns md5sum for a message object of type '<RemovePlane-request>"
  "c42c99a30e4f5366c44d66ce6d33c1f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RemovePlane-request)))
  "Returns md5sum for a message object of type 'RemovePlane-request"
  "c42c99a30e4f5366c44d66ce6d33c1f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RemovePlane-request>)))
  "Returns full string definition for message of type '<RemovePlane-request>"
  (cl:format cl:nil "bool sim~%int16 planeID~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RemovePlane-request)))
  "Returns full string definition for message of type 'RemovePlane-request"
  (cl:format cl:nil "bool sim~%int16 planeID~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RemovePlane-request>))
  (cl:+ 0
     1
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RemovePlane-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RemovePlane-request
    (cl:cons ':sim (sim msg))
    (cl:cons ':planeID (planeID msg))
))
;//! \htmlinclude RemovePlane-response.msg.html

(cl:defclass <RemovePlane-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:string
    :initform ""))
)

(cl:defclass RemovePlane-response (<RemovePlane-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RemovePlane-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RemovePlane-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<RemovePlane-response> is deprecated: use au_uav_ros-srv:RemovePlane-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <RemovePlane-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:error-val is deprecated.  Use au_uav_ros-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RemovePlane-response>) ostream)
  "Serializes a message object of type '<RemovePlane-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RemovePlane-response>) istream)
  "Deserializes a message object of type '<RemovePlane-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RemovePlane-response>)))
  "Returns string type for a service object of type '<RemovePlane-response>"
  "au_uav_ros/RemovePlaneResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RemovePlane-response)))
  "Returns string type for a service object of type 'RemovePlane-response"
  "au_uav_ros/RemovePlaneResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RemovePlane-response>)))
  "Returns md5sum for a message object of type '<RemovePlane-response>"
  "c42c99a30e4f5366c44d66ce6d33c1f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RemovePlane-response)))
  "Returns md5sum for a message object of type 'RemovePlane-response"
  "c42c99a30e4f5366c44d66ce6d33c1f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RemovePlane-response>)))
  "Returns full string definition for message of type '<RemovePlane-response>"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RemovePlane-response)))
  "Returns full string definition for message of type 'RemovePlane-response"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RemovePlane-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RemovePlane-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RemovePlane-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RemovePlane)))
  'RemovePlane-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RemovePlane)))
  'RemovePlane-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RemovePlane)))
  "Returns string type for a service object of type '<RemovePlane>"
  "au_uav_ros/RemovePlane")