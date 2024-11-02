import sys
import os
import rospy
path =  os.path.abspath(".")
sys.path.insert(0,"/home/li/graduation_design/src/real_robot/scripts")
from ZLAC8015D import MotorController
from geometry_msgs.msg import Twist
import time
motors = MotorController(port="/dev/ttyUSB1",id=1)
class zlac_driver:
    def __init__(self):
        rospy.init_node("zlac_driver_control",disable_signals=True)
        self.rate = rospy.Rate(20)
        
        self.init_motors()
        subvel = rospy.Subscriber("/mycar/cmd_vel",Twist,self.cmdvel_callback,queue_size=1)
        rospy.spin()

        
    def init_motors(self):
        motors.disable_motor()
        motors.set_accel_time(100,100)
        motors.set_decel_time(100,100)
        motors.set_mode(3)
        motors.enable_motor()

    def twist_to_diff(self,linear,angular):
        left_v = linear - angular * 0.25
        right_v = linear + angular * 0.25
        left_rpm = left_v * (1 / (0.2 * 3.14 / 60))
        right_rpm = right_v *  (1 / (0.2 * 3.14 / 60))
        right_rpm = -right_rpm
        return [left_rpm,right_rpm]

    def cmdvel_callback(self,data):
        [leftrpm,rightrpm] = self.twist_to_diff(data.linear.x,data.angular.z)
        motors.set_rpm(int(leftrpm),int(rightrpm))
    
    def stop_motors(self):
        motors.disable_motor()

if __name__ == "__main__":
    try:
        ZLAC = zlac_driver()
    except rospy.ROSInterruptException:
        print(111)
    rospy.signal_shutdown("停止运动")
    motors.disable_motor()
        


