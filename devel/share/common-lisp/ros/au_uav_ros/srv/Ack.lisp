; Auto-generated. Do not edit!


(cl:in-package au_uav_ros-srv)


;//! \htmlinclude Ack-request.msg.html

(cl:defclass <Ack-request> (roslisp-msg-protocol:ros-message)
  ((planeID
    :reader planeID
    :initarg :planeID
    :type cl:fixnum
    :initform 0)
   (msgID
    :reader msgID
    :initarg :msgID
    :type cl:fixnum
    :initform 0)
   (param_value
    :reader param_value
    :initarg :param_value
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Ack-request (<Ack-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Ack-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Ack-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<Ack-request> is deprecated: use au_uav_ros-srv:Ack-request instead.")))

(cl:ensure-generic-function 'planeID-val :lambda-list '(m))
(cl:defmethod planeID-val ((m <Ack-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:planeID-val is deprecated.  Use au_uav_ros-srv:planeID instead.")
  (planeID m))

(cl:ensure-generic-function 'msgID-val :lambda-list '(m))
(cl:defmethod msgID-val ((m <Ack-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:msgID-val is deprecated.  Use au_uav_ros-srv:msgID instead.")
  (msgID m))

(cl:ensure-generic-function 'param_value-val :lambda-list '(m))
(cl:defmethod param_value-val ((m <Ack-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:param_value-val is deprecated.  Use au_uav_ros-srv:param_value instead.")
  (param_value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Ack-request>) ostream)
  "Serializes a message object of type '<Ack-request>"
  (cl:let* ((signed (cl:slot-value msg 'planeID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'msgID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'param_value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Ack-request>) istream)
  "Deserializes a message object of type '<Ack-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'planeID) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'msgID) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'param_value) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Ack-request>)))
  "Returns string type for a service object of type '<Ack-request>"
  "au_uav_ros/AckRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ack-request)))
  "Returns string type for a service object of type 'Ack-request"
  "au_uav_ros/AckRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Ack-request>)))
  "Returns md5sum for a message object of type '<Ack-request>"
  "d95a447a727bc97dc8f1fa2e0ae843fc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Ack-request)))
  "Returns md5sum for a message object of type 'Ack-request"
  "d95a447a727bc97dc8f1fa2e0ae843fc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Ack-request>)))
  "Returns full string definition for message of type '<Ack-request>"
  (cl:format cl:nil "int16 planeID~%int16 msgID~%int16 param_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Ack-request)))
  "Returns full string definition for message of type 'Ack-request"
  (cl:format cl:nil "int16 planeID~%int16 msgID~%int16 param_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Ack-request>))
  (cl:+ 0
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Ack-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Ack-request
    (cl:cons ':planeID (planeID msg))
    (cl:cons ':msgID (msgID msg))
    (cl:cons ':param_value (param_value msg))
))
;//! \htmlinclude Ack-response.msg.html

(cl:defclass <Ack-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Ack-response (<Ack-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Ack-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Ack-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<Ack-response> is deprecated: use au_uav_ros-srv:Ack-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Ack-response>) ostream)
  "Serializes a message object of type '<Ack-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Ack-response>) istream)
  "Deserializes a message object of type '<Ack-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Ack-response>)))
  "Returns string type for a service object of type '<Ack-response>"
  "au_uav_ros/AckResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ack-response)))
  "Returns string type for a service object of type 'Ack-response"
  "au_uav_ros/AckResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Ack-response>)))
  "Returns md5sum for a message object of type '<Ack-response>"
  "d95a447a727bc97dc8f1fa2e0ae843fc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Ack-response)))
  "Returns md5sum for a message object of type 'Ack-response"
  "d95a447a727bc97dc8f1fa2e0ae843fc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Ack-response>)))
  "Returns full string definition for message of type '<Ack-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Ack-response)))
  "Returns full string definition for message of type 'Ack-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Ack-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Ack-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Ack-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Ack)))
  'Ack-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Ack)))
  'Ack-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ack)))
  "Returns string type for a service object of type '<Ack>"
  "au_uav_ros/Ack")