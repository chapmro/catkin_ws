; Auto-generated. Do not edit!


(cl:in-package au_uav_ros-srv)


;//! \htmlinclude LoadCourse-request.msg.html

(cl:defclass <LoadCourse-request> (roslisp-msg-protocol:ros-message)
  ((filename
    :reader filename
    :initarg :filename
    :type cl:string
    :initform "")
   (wipe
    :reader wipe
    :initarg :wipe
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LoadCourse-request (<LoadCourse-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadCourse-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadCourse-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<LoadCourse-request> is deprecated: use au_uav_ros-srv:LoadCourse-request instead.")))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <LoadCourse-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:filename-val is deprecated.  Use au_uav_ros-srv:filename instead.")
  (filename m))

(cl:ensure-generic-function 'wipe-val :lambda-list '(m))
(cl:defmethod wipe-val ((m <LoadCourse-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:wipe-val is deprecated.  Use au_uav_ros-srv:wipe instead.")
  (wipe m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadCourse-request>) ostream)
  "Serializes a message object of type '<LoadCourse-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filename))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wipe) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadCourse-request>) istream)
  "Deserializes a message object of type '<LoadCourse-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'wipe) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadCourse-request>)))
  "Returns string type for a service object of type '<LoadCourse-request>"
  "au_uav_ros/LoadCourseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadCourse-request)))
  "Returns string type for a service object of type 'LoadCourse-request"
  "au_uav_ros/LoadCourseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadCourse-request>)))
  "Returns md5sum for a message object of type '<LoadCourse-request>"
  "a9491a8eda0f575eae59065a513158a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadCourse-request)))
  "Returns md5sum for a message object of type 'LoadCourse-request"
  "a9491a8eda0f575eae59065a513158a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadCourse-request>)))
  "Returns full string definition for message of type '<LoadCourse-request>"
  (cl:format cl:nil "string filename~%bool wipe~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadCourse-request)))
  "Returns full string definition for message of type 'LoadCourse-request"
  (cl:format cl:nil "string filename~%bool wipe~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadCourse-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'filename))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadCourse-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadCourse-request
    (cl:cons ':filename (filename msg))
    (cl:cons ':wipe (wipe msg))
))
;//! \htmlinclude LoadCourse-response.msg.html

(cl:defclass <LoadCourse-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:string
    :initform ""))
)

(cl:defclass LoadCourse-response (<LoadCourse-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadCourse-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadCourse-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name au_uav_ros-srv:<LoadCourse-response> is deprecated: use au_uav_ros-srv:LoadCourse-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <LoadCourse-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader au_uav_ros-srv:error-val is deprecated.  Use au_uav_ros-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadCourse-response>) ostream)
  "Serializes a message object of type '<LoadCourse-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadCourse-response>) istream)
  "Deserializes a message object of type '<LoadCourse-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadCourse-response>)))
  "Returns string type for a service object of type '<LoadCourse-response>"
  "au_uav_ros/LoadCourseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadCourse-response)))
  "Returns string type for a service object of type 'LoadCourse-response"
  "au_uav_ros/LoadCourseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadCourse-response>)))
  "Returns md5sum for a message object of type '<LoadCourse-response>"
  "a9491a8eda0f575eae59065a513158a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadCourse-response)))
  "Returns md5sum for a message object of type 'LoadCourse-response"
  "a9491a8eda0f575eae59065a513158a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadCourse-response>)))
  "Returns full string definition for message of type '<LoadCourse-response>"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadCourse-response)))
  "Returns full string definition for message of type 'LoadCourse-response"
  (cl:format cl:nil "string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadCourse-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadCourse-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadCourse-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LoadCourse)))
  'LoadCourse-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LoadCourse)))
  'LoadCourse-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadCourse)))
  "Returns string type for a service object of type '<LoadCourse>"
  "au_uav_ros/LoadCourse")