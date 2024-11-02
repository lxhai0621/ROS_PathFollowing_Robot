; Auto-generated. Do not edit!


(cl:in-package real_robot-msg)


;//! \htmlinclude Control.msg.html

(cl:defclass <Control> (roslisp-msg-protocol:ros-message)
  ((around
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

(cl:defclass Control (<Control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name real_robot-msg:<Control> is deprecated: use real_robot-msg:Control instead.")))

(cl:ensure-generic-function 'around-val :lambda-list '(m))
(cl:defmethod around-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader real_robot-msg:around-val is deprecated.  Use real_robot-msg:around instead.")
  (around m))

(cl:ensure-generic-function 'about-val :lambda-list '(m))
(cl:defmethod about-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader real_robot-msg:about-val is deprecated.  Use real_robot-msg:about instead.")
  (about m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Control>) ostream)
  "Serializes a message object of type '<Control>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'around) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'about) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Control>) istream)
  "Deserializes a message object of type '<Control>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'around) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'about) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Control>)))
  "Returns string type for a message object of type '<Control>"
  "real_robot/Control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Control)))
  "Returns string type for a message object of type 'Control"
  "real_robot/Control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Control>)))
  "Returns md5sum for a message object of type '<Control>"
  "560db3b62e0e7f20a5607776494d55f7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Control)))
  "Returns md5sum for a message object of type 'Control"
  "560db3b62e0e7f20a5607776494d55f7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Control>)))
  "Returns full string definition for message of type '<Control>"
  (cl:format cl:nil "std_msgs/Int32 around~%std_msgs/Int32 about~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Control)))
  "Returns full string definition for message of type 'Control"
  (cl:format cl:nil "std_msgs/Int32 around~%std_msgs/Int32 about~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Control>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'around))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'about))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Control>))
  "Converts a ROS message object to a list"
  (cl:list 'Control
    (cl:cons ':around (around msg))
    (cl:cons ':about (about msg))
))
