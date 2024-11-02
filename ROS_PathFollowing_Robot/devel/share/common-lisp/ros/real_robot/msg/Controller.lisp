; Auto-generated. Do not edit!


(cl:in-package real_robot-msg)


;//! \htmlinclude Controller.msg.html

(cl:defclass <Controller> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (around
    :reader around
    :initarg :around
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (about
    :reader about
    :initarg :about
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32)))
)

(cl:defclass Controller (<Controller>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Controller>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Controller)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name real_robot-msg:<Controller> is deprecated: use real_robot-msg:Controller instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader real_robot-msg:header-val is deprecated.  Use real_robot-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'around-val :lambda-list '(m))
(cl:defmethod around-val ((m <Controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader real_robot-msg:around-val is deprecated.  Use real_robot-msg:around instead.")
  (around m))

(cl:ensure-generic-function 'about-val :lambda-list '(m))
(cl:defmethod about-val ((m <Controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader real_robot-msg:about-val is deprecated.  Use real_robot-msg:about instead.")
  (about m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Controller>) ostream)
  "Serializes a message object of type '<Controller>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'around) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'about) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Controller>) istream)
  "Deserializes a message object of type '<Controller>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'around) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'about) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Controller>)))
  "Returns string type for a message object of type '<Controller>"
  "real_robot/Controller")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Controller)))
  "Returns string type for a message object of type 'Controller"
  "real_robot/Controller")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Controller>)))
  "Returns md5sum for a message object of type '<Controller>"
  "d311acc178140cf7a23ce6368d21fe8e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Controller)))
  "Returns md5sum for a message object of type 'Controller"
  "d311acc178140cf7a23ce6368d21fe8e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Controller>)))
  "Returns full string definition for message of type '<Controller>"
  (cl:format cl:nil "Header header~%std_msgs/Int32 around~%std_msgs/Int32 about~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Controller)))
  "Returns full string definition for message of type 'Controller"
  (cl:format cl:nil "Header header~%std_msgs/Int32 around~%std_msgs/Int32 about~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Controller>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'around))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'about))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Controller>))
  "Converts a ROS message object to a list"
  (cl:list 'Controller
    (cl:cons ':header (header msg))
    (cl:cons ':around (around msg))
    (cl:cons ':about (about msg))
))
