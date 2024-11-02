;; Auto-generated. Do not edit!


(when (boundp 'real_robot::Controller)
  (if (not (find-package "REAL_ROBOT"))
    (make-package "REAL_ROBOT"))
  (shadow 'Controller (find-package "REAL_ROBOT")))
(unless (find-package "REAL_ROBOT::CONTROLLER")
  (make-package "REAL_ROBOT::CONTROLLER"))

(in-package "ROS")
;;//! \htmlinclude Controller.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass real_robot::Controller
  :super ros::object
  :slots (_header _around _about ))

(defmethod real_robot::Controller
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:around __around) (instance std_msgs::Int32 :init))
    ((:about __about) (instance std_msgs::Int32 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _around __around)
   (setq _about __about)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:around
   (&rest __around)
   (if (keywordp (car __around))
       (send* _around __around)
     (progn
       (if __around (setq _around (car __around)))
       _around)))
  (:about
   (&rest __about)
   (if (keywordp (car __about))
       (send* _about __about)
     (progn
       (if __about (setq _about (car __about)))
       _about)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; std_msgs/Int32 _around
    (send _around :serialization-length)
    ;; std_msgs/Int32 _about
    (send _about :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/Int32 _around
       (send _around :serialize s)
     ;; std_msgs/Int32 _about
       (send _about :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/Int32 _around
     (send _around :deserialize buf ptr-) (incf ptr- (send _around :serialization-length))
   ;; std_msgs/Int32 _about
     (send _about :deserialize buf ptr-) (incf ptr- (send _about :serialization-length))
   ;;
   self)
  )

(setf (get real_robot::Controller :md5sum-) "d311acc178140cf7a23ce6368d21fe8e")
(setf (get real_robot::Controller :datatype-) "real_robot/Controller")
(setf (get real_robot::Controller :definition-)
      "Header header
std_msgs/Int32 around
std_msgs/Int32 about
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: std_msgs/Int32
int32 data
")



(provide :real_robot/Controller "d311acc178140cf7a23ce6368d21fe8e")


