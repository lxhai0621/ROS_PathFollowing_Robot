import sys
import os
import rospy
path =  os.path.abspath(".")
sys.path.insert(0,"/home/li/graduation_design/src/real_robot/scripts")
from real_robot.msg import ControllerMsg
from ZLAC8015D import MotorController

motors = MotorController(port="/dev/ttyUSB1",id=1)
class Remote_Control(object):
    def __init__(self):
        rospy.init_node("remote_control")
        self.motor_init()
        self.remote_sub = rospy.Subscriber("/mycar/remote_control",ControllerMsg,self.call_back,queue_size=1)
        self.instrution = None
        self.rate = rospy.Rate(60)
        while not rospy.is_shutdown():
            self.vel_transmit()
            self.rate.sleep()
        
    def motor_init(self):
        motors.disable_motor()
        motors.set_accel_time(100,100)
        motors.set_decel_time(100,100)
        motors.set_mode(3)
        motors.enable_motor()
        rospy.loginfo("success")

    def call_back(self,msg):
        self.instrution = msg

    def rc_deadband_limit(self,CHASSIS_RC_DEADLINE):
        if CHASSIS_RC_DEADLINE < 10 and CHASSIS_RC_DEADLINE > -10:
            output_value = 0
        else:
            output_value = CHASSIS_RC_DEADLINE
        return output_value

    def vel_transmit(self):
        if self.instrution:
            speed = int(0.2 * self.rc_deadband_limit(self.instrution.around.data - 1024))
            rightspeed = int(0.05 * self.rc_deadband_limit(self.instrution.about.data - 1024) + speed)
            leftspeed = int(0.05 * self.rc_deadband_limit(self.instrution.about.data - 1024) - speed)
            motors.set_rpm(leftspeed,rightspeed)
        
            


            
if __name__ == "__main__":
    try:
        Remote_Control()
    except rospy.ROSInterruptException:
        #rospy.signal_shutdown("停止运动")
        #motors.disable_motor()
        print(111)
    
    rospy.signal_shutdown("停止运动")
    motors.disable_motor()

