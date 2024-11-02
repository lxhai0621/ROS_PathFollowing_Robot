#!/usr/bin/env python3

from sensor_msgs.msg import NavSatFix
import pymap3d as pm
from geometry_msgs.msg import PoseStamped,QuaternionStamped,Quaternion
import rospy
import tf
import csv
import time

lat0 = 40.48805428
lon0 = 111.77905125
h0 = 0
pose = None
heading = None
def pose_cb(msg):
    pose = msg
    pub = rospy.Publisher("/mycar/pose",PoseStamped,queue_size=1)
    tf_pose = PoseStamped()
    tf_pose.pose.position.x,tf_pose.pose.position.y,tf_pose.pose.position.z = pm.geodetic2enu(float(pose.latitude),float(pose.longitude),0,lat0,lon0,h0)
    #rospy.loginfo("x:%s,y:%s",tf_pose.pose.position.x,tf_pose.pose.position.y)
    pub.publish(tf_pose)

def heading_cb(msg):
    pub = rospy.Publisher("/mycar/poseheading",PoseStamped,queue_size=1)
    pose_heading = PoseStamped()
    pose_heading.pose.orientation.x = msg.quaternion.x
    pose_heading.pose.orientation.y = msg.quaternion.y
    pose_heading.pose.orientation.z = msg.quaternion.z
    pose_heading.pose.orientation.w = msg.quaternion.w
    euler = tf.transformations.euler_from_quaternion([pose_heading.pose.orientation.x,pose_heading.pose.orientation.y,pose_heading.pose.orientation.z,pose_heading.pose.orientation.w])
    yaw = euler[2]
    angle_yaw = round(yaw * (180 / 3.1415926),2)
    rospy.loginfo(angle_yaw)
    q = tf.transformations.quaternion_from_euler(0,0,yaw)
    pose_heading.pose.orientation.x = q[0]
    pose_heading.pose.orientation.y = q[1]
    pose_heading.pose.orientation.z = q[2]
    pose_heading.pose.orientation.w = q[3]
    pub.publish(pose_heading)

    



if __name__ == "__main__":
    rospy.init_node("pose_get")
    rospy.Subscriber("/fix",NavSatFix,pose_cb,queue_size=1)
    rospy.Subscriber("/heading",QuaternionStamped,heading_cb,queue_size=1)
    rospy.spin()
