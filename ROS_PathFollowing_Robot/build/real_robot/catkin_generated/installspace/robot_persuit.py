#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import PoseStamped,TwistStamped,Twist,Quaternion
from algorithm_simulation.msg import Lane,Waypoint
from gazebo_msgs.msg import ModelStates
import math
import tf
import time
import csv

HORIZON = 1
class Robot_persuit(object):
    def __init__(self):
        rospy.init_node("robot_persuit")
        rospy.Subscriber("/local_waypoints",Lane,self.waypoints_callback,queue_size=1)
        rospy.Subscriber("/mycar/pose",PoseStamped,self.pose_callback,queue_size=1)
        rospy.Subscriber("/mycar/poseheading",PoseStamped,self.poseheading_callback,queue_size=1)
        
        vel_pub = rospy.Publisher("/mycar/cmd_vel",Twist,queue_size=1)
        self.Current_pose = None
        self.Current_waypoints = None
        self.heading = None
        self.rate = rospy.Rate(20)
        while not rospy.is_shutdown():
            if self.Current_pose and self.Current_waypoints:
                twistCommand = self.calculateTwist() #获取小车需要的线速度和角速度用于发布
                vel_pub.publish(twistCommand)
            self.rate.sleep()

    def pose_callback(self,data):
        self.Current_pose = data

    def waypoints_callback(self,data):
        self.Current_waypoints = data

    def poseheading_callback(self,data):
        self.heading = data
    
    def calculateTwist(self):
        lad = 0.0 
        target_point = 0
        #找到局部路径坐标点中距离前视点最近的点
        for i in range(len(self.Current_waypoints.waypoints)):
            if (i+1) < len(self.Current_waypoints.waypoints):
                this_x = self.Current_waypoints.waypoints[i].pose.pose.position.x
                this_y = self.Current_waypoints.waypoints[i].pose.pose.position.y
                next_x = self.Current_waypoints.waypoints[i+1].pose.pose.position.x
                next_y = self.Current_waypoints.waypoints[i+1].pose.pose.position.y
                lad = lad + math.hypot(next_x-this_x,next_y-this_y)
                if(lad > HORIZON):
                    target_point = i + 1
                    break

        #得到要追踪的目标点和追踪速度
        targetWaypoint = self.Current_waypoints.waypoints[target_point]
        targetSpeed = 0.2
        #获取当前小车和目标点的具体坐标信息
        targetX = targetWaypoint.pose.pose.position.x
        targetY = targetWaypoint.pose.pose.position.y
        currentX = self.Current_pose.pose.position.x
        currentY = self.Current_pose.pose.position.y
        rospy.loginfo("Currentx:%s,Currenty:%s,Targetx:%s,Targety:%s",currentX,currentY,targetX,targetY)

        #获取小车当前的方位角
        quaternion = (self.heading.pose.orientation.x,self.heading.pose.orientation.y,self.heading.pose.orientation.z,self.heading.pose.orientation.w)
        euler = tf.transformations.euler_from_quaternion(quaternion)
        yaw = euler[2]
        angle_yaw = round(yaw * (180 / 3.1415926),2)
        t = time.strftime("%Y-%m-%d %H:%M:%S",time.localtime())
        with open("/home/li/graduation_design/pose_record.csv","a+") as f:
            writer = csv.writer(f)
            writer.writerow([t,currentX,currentY,targetX,targetY,angle_yaw])

        #获取小车与目标点之间的夹角和距离
        alpha = math.atan2(targetY - currentY,targetX - currentX) - yaw
        #rospy.loginfo(alpha)
        ld = math.sqrt(math.pow(targetY - currentY,2)+math.pow(targetX - currentX,2))
        ey = math.sin(alpha) * ld
        ld_2 = ld * ld

        if ld > 0.2: #路径追踪
            theta =( 2 * targetSpeed * ey / ld_2 ) 
            twistcmd = Twist()
            twistcmd.linear.x = targetSpeed
            twistcmd.angular.z = theta
        else : #到终点停车
            twistcmd = Twist()
            twistcmd.linear.x = 0
            twistcmd.angular.z = 0
        
        return twistcmd





if __name__ == "__main__":
    Robot_persuit()
