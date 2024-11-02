import sys
import os
import rospy
path =  os.path.abspath(".")
sys.path.insert(0,path + "/src/algorithm_simulation/scripts")
from ZLAC8015D import Controller
from geometry_msgs.msg import Twist
import time

class zlac_driver:
    def __init__(self):
        rospy.init_node("zalc_driver_control")
        self.rate = rospy.Rate(20)
        self.motors = Controller(port="/dev/ttyUSB0")
        self.init_motors()
        subvel = rospy.Subscriber("cmd_vel",Twist,self.cmdvel_callback,queue_size=1)
        rospy.spin()

        
    def init_motors(self):
        self.motors.disable_motor(1)
        self.motors.set_accel_time(100,100,1)
        self.motors.set_decel_time(100,100,1)
        self.motors.set_mode(3,1)
        self.motors.enable_motor(1)

    def twist_to_diff(self,linear,angular):
        left_v = linear - angular * 0.25
        right_v = linear + angular * 0.25
        left_rpm = left_v * (1 / (0.2 * 3.14 / 60))
        right_rpm = right_v * * (1 / (0.2 * 3.14 / 60))
        right_rpm = -right_rpm
        return [left_rpm,right_rpm]

    def cmdvel_callback(self,data):
        [leftrpm,rightrpm] = self.twist_to_diff(data.linear.x,data.angular.z)
        self.motors.set_rpm(leftrpm,rightrpm)

if __name__ == "__main__":
    zlac_driver()
        


