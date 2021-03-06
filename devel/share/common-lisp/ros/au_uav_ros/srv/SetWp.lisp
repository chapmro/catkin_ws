; Auto-generated. Do not edit!


(cl:in-package au_uav_ros-srv)


;//! \htmlinclude SetWp-request.msg.html

(cl:defclass <SetWp-request> (roslisp-msg-protocol:ros-message)
  ((sim
    :reader sim
    :initarg :sim
    :type cl:boolean
    :initform cl:nil)
   (planeID
    :reader planeID
    :initarg :planeID
    :type cl:fixnum
    :initform 0)
   (latitude
    :reader latitude
    :initarg :latitude
    :type cl:float
    :initform 0.0)
   (longitude
    :reader longitude
    :initarg :longitude
    :type cl:float
    :initform 0.0)
   (altitude
    :reader altitude
    :initarg :altitude
    :type cl:float
    :initform 0.0))
)

(cl:defclass SetWp-request (<SetWp-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetWp-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetWp-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<SetWp-request> is deprecated: use au_uav_ros-srv:SetWp-request instead.")))

(cl:ensure-generic-function 'sim-val :lambda-list '(m))
(cl:defmethod sim-val ((m <SetWp-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:sim-val is deprecated.  Use au_uav_ros-srv:sim instead.")
  (sim m))

(cl:ensure-generic-function 'planeID-val :lambda-list '(m))
(cl:defmethod planeID-val ((m <SetWp-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:planeID-val is deprecated.  Use au_uav_ros-srv:planeID instead.")
  (planeID m))

(cl:ensure-generic-function 'latitude-val :lambda-list '(m))
(cl:defmethod latitude-val ((m <SetWp-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:latitude-val is deprecated.  Use au_uav_ros-srv:latitude instead.")
  (latitude m))

(cl:ensure-generic-function 'longitude-val :lambda-list '(m))
(cl:defmethod longitude-val ((m <SetWp-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:longitude-val is deprecated.  Use au_uav_ros-srv:longitude instead.")
  (longitude m))

(cl:ensure-generic-function 'altitude-val :lambda-list '(m))
(cl:defmethod altitude-val ((m <SetWp-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:altitude-val is deprecated.  Use au_uav_ros-srv:altitude instead.")
  (altitude m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetWp-request>) ostream)
  "Serializes a message object of type '<SetWp-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'sim) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'planeID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'altitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetWp-request>) istream)
  "Deserializes a message object of type '<SetWp-request>"
    (cl:setf (cl:slot-value msg 'sim) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'planeID) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'altitude) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetWp-request>)))
  "Returns string type for a service object of type '<SetWp-request>"
  "au_uav_ros/SetWpRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetWp-request)))
  "Returns string type for a service object of type 'SetWp-request"
  "au_uav_ros/SetWpRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetWp-request>)))
  "Returns md5sum for a message object of type '<SetWp-request>"
  "0ba02f63a69a12b67d8ef6f648ea4a77")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetWp-request)))
  "Returns md5sum for a message object of type 'SetWp-request"
  "0ba02f63a69a12b67d8ef6f648ea4a77")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetWp-request>)))
  "Returns full string definition for message of type '<SetWp-request>"
  (cl:format cl:nil "bool sim~%int16 planeID~%float64 latitude~%float64 longitude~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetWp-request)))
  "Returns full string definition for message of type 'SetWp-request"
  (cl:format cl:nil "bool sim~%int16 planeID~%float64 latitude~%float64 longitude~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetWp-request>))
  (cl:+ 0
     1
     2
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetWp-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetWp-request
    (cl:cons ':sim (sim msg))
    (cl:cons ':planeID (planeID msg))
    (cl:cons ':latitude (latitude msg))
    (cl:cons ':longitude (longitude msg))
    (cl:cons ':altitude (altitude msg))
))
;//! \htmlinclude SetWp-response.msg.html

(cl:defclass <SetWp-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:string
    :initform ""))
)

(cl:defclass SetWp-response (<SetWp-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetWp-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetWp-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<SetWp-response> is deprecated: use au_uav_ros-srv:SetWp-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetWp-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:error-val is deprecated.  Use au_uav_ros-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetWp-response>) ostream)
  "Serializes a message object of type '<SetWp-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetWp-response>) istream)
  "Deserializes a message object of type '<SetWp-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetWp-response>)))
  "Returns string type for a service object of type '<SetWp-response>"
  "au_uav_ros/SetWpResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetWp-response)))
  "Returns string type for a service object of type 'SetWp-response"
  "au_uav_ros/SetWpResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetWp-response>)))
  "Returns md5sum for a message object of type '<SetWp-response>"
  "0ba02f63a69a12b67d8ef6f648ea4a77")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetWp-response)))
  "Returns md5sum for a message object of type 'SetWp-response"
  "0ba02f63a69a12b67d8ef6f648ea4a77")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetWp-response>)))
  "Returns full string definition for message of type '<SetWp-response>"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetWp-response)))
  "Returns full string definition for message of type 'SetWp-response"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetWp-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetWp-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetWp-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetWp)))
  'SetWp-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetWp)))
  'SetWp-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetWp)))
  "Returns string type for a service object of type '<SetWp>"
  "au_uav_ros/SetWp")