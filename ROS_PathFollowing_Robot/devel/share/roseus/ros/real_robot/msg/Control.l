;; Auto-generated. Do not edit!


(when (boundp 'real_robot::Control)
  (if (not (find-package "REAL_ROBOT"))
    (make-package "REAL_ROBOT"))
  (shadow 'Control (find-package "REAL_ROBOT")))
(unless (find-package "REAL_ROBOT::CONTROL")
  (make-package "REAL_ROBOT::CONTROL"))

(in-package "ROS")
;;//! \htmlinclude Control.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass real_robot::Control
  :super ros::object
  :slots (_around _about ))

(defmethod real_robot::Control
  (:init
   (&key
    ((:around __around) (instance std_msgs::Int32 :init))
    ((:about __about) (instance std_msgs::Int32 :init))
    )
   (send-super :init)
   (setq _around __around)
   (setq _about __about)
   self)
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
    ;; std_msgs/Int32 _around
    (send _around :serialization-length)
    ;; std_msgs/Int32 _about
    (send _about :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Int32 _around
       (send _around :serialize s)
     ;; std_msgs/Int32 _about
       (send _about :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Int32 _around
     (send _around :deserialize buf ptr-) (incf ptr- (send _around :serialization-length))
   ;; std_msgs/Int32 _about
     (send _about :deserialize buf ptr-) (incf ptr- (send _about :serialization-length))
   ;;
   self)
  )

(setf (get real_robot::Control :md5sum-) "560db3b62e0e7f20a5607776494d55f7")
(setf (get real_robot::Control :datatype-) "real_robot/Control")
(setf (get real_robot::Control :definition-)
      "std_msgs/Int32 around
std_msgs/Int32 about
================================================================================
MSG: std_msgs/Int32
int32 data
")



(provide :real_robot/Control "560db3b62e0e7f20a5607776494d55f7")


