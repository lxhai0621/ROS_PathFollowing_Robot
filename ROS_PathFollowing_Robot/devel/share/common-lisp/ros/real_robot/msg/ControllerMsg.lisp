; Auto-generated. Do not edit!


(cl:in-package real_robot-msg)


;//! \htmlinclude ControllerMsg.msg.html

(cl:defclass <ControllerMsg> (roslisp-msg-protocol:ros-message)
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

(cl:defclass ControllerMsg (<ControllerMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControllerMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControllerMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name real_robot-msg:<ControllerMsg> is deprecated: use real_robot-msg:ControllerMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ControllerMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader real_robot-msg:header-val is deprecated.  Use real_robot-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'around-val :lambda-list '(m))
(cl:defmethod around-val ((m <ControllerMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader real_robot-msg:around-val is deprecated.  Use real_robot-msg:around instead.")
  (around m))

(cl:ensure-generic-function 'about-val :lambda-list '(m))
(cl:defmethod about-val ((m <ControllerMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader real_robot-msg:about-val is deprecated.  Use real_robot-msg:about instead.")
  (about m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControllerMsg>) ostream)
  "Serializes a message object of type '<ControllerMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'around) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'about) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControllerMsg>) istream)
  "Deserializes a message object of type '<ControllerMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'around) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'about) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControllerMsg>)))
  "Returns string type for a message object of type '<ControllerMsg>"
  "real_robot/ControllerMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControllerMsg)))
  "Returns string type for a message object of type 'ControllerMsg"
  "real_robot/ControllerMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControllerMsg>)))
  "Returns md5sum for a message object of type '<ControllerMsg>"
  "d311acc178140cf7a23ce6368d21fe8e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControllerMsg)))
  "Returns md5sum for a message object of type 'ControllerMsg"
  "d311acc178140cf7a23ce6368d21fe8e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControllerMsg>)))
  "Returns full string definition for message of type '<ControllerMsg>"
  (cl:format cl:nil "Header header~%std_msgs/Int32 around~%std_msgs/Int32 about~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControllerMsg)))
  "Returns full string definition for message of type 'ControllerMsg"
  (cl:format cl:nil "Header header~%std_msgs/Int32 around~%std_msgs/Int32 about~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControllerMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'around))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'about))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControllerMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'ControllerMsg
    (cl:cons ':header (header msg))
    (cl:cons ':around (around msg))
    (cl:cons ':about (about msg))
))
