#!/usr/bin/env python

import rospy
import os
import csv
from geometry_msgs.msg import PoseStamped,Quaternion
from algorithm_simulation.msg import Lane,Waypoint
from scipy.spatial import KDTree

class LocalLoad(object):
    def __init__(self):
        rospy.init_node("local_load")
        rospy.Subscriber("/waypoint",Lane,self.waypoint_cb,queue_size=1)
        rospy.Subscriber("/mycar/pose",PoseStamped,self.pose_cb,queue_size=1)

        self.local_waypoint_pub = rospy.Publisher("/local_waypoints",Lane,queue_size=1)

        self.global_path = None
        self.waypoint_tree = None
        self.plane = None
        self.pose = None

        rate = rospy.Rate(20)
        while not rospy.is_shutdown():
            if self.waypoint_tree and self.plane and self.pose:
                closest_point = self.get_closest()
                self.publish(closest_point)
            rate.sleep()

    def waypoint_cb(self,msg):
        self.global_path = msg
        if not self.plane:
            self.plane = [[p.pose.pose.position.x,p.pose.pose.position.y] for p in msg.waypoints]
            self.waypoint_tree = KDTree(self.plane)

    def pose_cb(self,data):
        self.pose = data

    def get_closest(self):
        x = self.pose.pose.position.x
        y = self.pose.pose.position.y

        closest = self.waypoint_tree.query([x,y],1)[1]
        return closest

    def publish(self,closest_point):
        lane = Lane()
        lane.header = self.global_path.header
        lane.waypoints = self.global_path.waypoints[closest_point:closest_point + 5]
        
        self.local_waypoint_pub.publish(lane)
        
if __name__ == "__main__":
    LocalLoad()
    