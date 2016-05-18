; Auto-generated. Do not edit!


(cl:in-package au_uav_ros-srv)


;//! \htmlinclude SimPlane-request.msg.html

(cl:defclass <SimPlane-request> (roslisp-msg-protocol:ros-message)
  ((clear
    :reader clear
    :initarg :clear
    :type cl:boolean
    :initform cl:nil)
   (planeID
    :reader planeID
    :initarg :planeID
    :type cl:fixnum
    :initform 0)
   (add
    :reader add
    :initarg :add
    :type cl:boolean
    :initform cl:nil)
   (latitudes
    :reader latitudes
    :initarg :latitudes
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (longitudes
    :reader longitudes
    :initarg :longitudes
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (altitudes
    :reader altitudes
    :initarg :altitudes
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (size
    :reader size
    :initarg :size
    :type cl:integer
    :initform 0))
)

(cl:defclass SimPlane-request (<SimPlane-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SimPlane-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SimPlane-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<SimPlane-request> is deprecated: use au_uav_ros-srv:SimPlane-request instead.")))

(cl:ensure-generic-function 'clear-val :lambda-list '(m))
(cl:defmethod clear-val ((m <SimPlane-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:clear-val is deprecated.  Use au_uav_ros-srv:clear instead.")
  (clear m))

(cl:ensure-generic-function 'planeID-val :lambda-list '(m))
(cl:defmethod planeID-val ((m <SimPlane-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:planeID-val is deprecated.  Use au_uav_ros-srv:planeID instead.")
  (planeID m))

(cl:ensure-generic-function 'add-val :lambda-list '(m))
(cl:defmethod add-val ((m <SimPlane-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:add-val is deprecated.  Use au_uav_ros-srv:add instead.")
  (add m))

(cl:ensure-generic-function 'latitudes-val :lambda-list '(m))
(cl:defmethod latitudes-val ((m <SimPlane-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:latitudes-val is deprecated.  Use au_uav_ros-srv:latitudes instead.")
  (latitudes m))

(cl:ensure-generic-function 'longitudes-val :lambda-list '(m))
(cl:defmethod longitudes-val ((m <SimPlane-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:longitudes-val is deprecated.  Use au_uav_ros-srv:longitudes instead.")
  (longitudes m))

(cl:ensure-generic-function 'altitudes-val :lambda-list '(m))
(cl:defmethod altitudes-val ((m <SimPlane-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:altitudes-val is deprecated.  Use au_uav_ros-srv:altitudes instead.")
  (altitudes m))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <SimPlane-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:size-val is deprecated.  Use au_uav_ros-srv:size instead.")
  (size m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SimPlane-request>) ostream)
  "Serializes a message object of type '<SimPlane-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'clear) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'planeID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'add) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'latitudes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'latitudes))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'longitudes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'longitudes))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'altitudes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'altitudes))
  (cl:let* ((signed (cl:slot-value msg 'size)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SimPlane-request>) istream)
  "Deserializes a message object of type '<SimPlane-request>"
    (cl:setf (cl:slot-value msg 'clear) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'planeID) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:slot-value msg 'add) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'latitudes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'latitudes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'longitudes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'longitudes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'altitudes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'altitudes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'size) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SimPlane-request>)))
  "Returns string type for a service object of type '<SimPlane-request>"
  "au_uav_ros/SimPlaneRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimPlane-request)))
  "Returns string type for a service object of type 'SimPlane-request"
  "au_uav_ros/SimPlaneRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SimPlane-request>)))
  "Returns md5sum for a message object of type '<SimPlane-request>"
  "6f87339775e7e8ada29616282172e07b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SimPlane-request)))
  "Returns md5sum for a message object of type 'SimPlane-request"
  "6f87339775e7e8ada29616282172e07b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SimPlane-request>)))
  "Returns full string definition for message of type '<SimPlane-request>"
  (cl:format cl:nil "bool clear~%int16 planeID~%bool add~%float64[] latitudes~%float64[] longitudes~%float64[] altitudes~%int32 size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SimPlane-request)))
  "Returns full string definition for message of type 'SimPlane-request"
  (cl:format cl:nil "bool clear~%int16 planeID~%bool add~%float64[] latitudes~%float64[] longitudes~%float64[] altitudes~%int32 size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SimPlane-request>))
  (cl:+ 0
     1
     2
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'latitudes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'longitudes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'altitudes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SimPlane-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SimPlane-request
    (cl:cons ':clear (clear msg))
    (cl:cons ':planeID (planeID msg))
    (cl:cons ':add (add msg))
    (cl:cons ':latitudes (latitudes msg))
    (cl:cons ':longitudes (longitudes msg))
    (cl:cons ':altitudes (altitudes msg))
    (cl:cons ':size (size msg))
))
;//! \htmlinclude SimPlane-response.msg.html

(cl:defclass <SimPlane-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:string
    :initform ""))
)

(cl:defclass SimPlane-response (<SimPlane-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SimPlane-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SimPlane-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<SimPlane-response> is deprecated: use au_uav_ros-srv:SimPlane-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SimPlane-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:error-val is deprecated.  Use au_uav_ros-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SimPlane-response>) ostream)
  "Serializes a message object of type '<SimPlane-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SimPlane-response>) istream)
  "Deserializes a message object of type '<SimPlane-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SimPlane-response>)))
  "Returns string type for a service object of type '<SimPlane-response>"
  "au_uav_ros/SimPlaneResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimPlane-response)))
  "Returns string type for a service object of type 'SimPlane-response"
  "au_uav_ros/SimPlaneResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SimPlane-response>)))
  "Returns md5sum for a message object of type '<SimPlane-response>"
  "6f87339775e7e8ada29616282172e07b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SimPlane-response)))
  "Returns md5sum for a message object of type 'SimPlane-response"
  "6f87339775e7e8ada29616282172e07b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SimPlane-response>)))
  "Returns full string definition for message of type '<SimPlane-response>"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SimPlane-response)))
  "Returns full string definition for message of type 'SimPlane-response"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SimPlane-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SimPlane-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SimPlane-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SimPlane)))
  'SimPlane-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SimPlane)))
  'SimPlane-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimPlane)))
  "Returns string type for a service object of type '<SimPlane>"
  "au_uav_ros/SimPlane")