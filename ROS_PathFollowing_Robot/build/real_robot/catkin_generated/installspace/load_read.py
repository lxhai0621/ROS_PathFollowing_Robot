#!/usr/bin/env python3

import rospy
import os
import csv
from geometry_msgs.msg import PoseStamped,Quaternion
from algorithm_simulation.msg import Lane,Waypoint
from nav_msgs.msg import Path
import math

class LoadRead(object):
    def __init__(self):
        rospy.init_node("load_read")
        self.pub = rospy.Publisher("/waypoint",Lane,queue_size=1,latch=True)
        self.path_pub = rospy.Publisher("/path",Path,queue_size=1,latch=True)
        self.publish("/home/li/graduation_design/load.csv")
        rospy.spin()

    def LoadWaypoint(self,filename):
        waypoints=[]
        with open(filename) as f:
            reader = csv.DictReader(f,['x','y','z'])
            for point in reader:
                p=Waypoint()
                p.pose.pose.position.x = float(point['x'])
                p.pose.pose.position.y = float(point['y'])
                p.twist.twist.linear.x = float(0.5)
                waypoints.append(p)
        return waypoints

    def publish(self,filename):
        if(os.path.isfile(filename)):
            waypoints = self.LoadWaypoint(filename)
            lane = Lane()
            lane.header.frame_id = 'gps'
            lane.header.stamp = rospy.Time(0)
            lane.waypoints = waypoints
            self.pub.publish(lane)
            rospy.loginfo("Waypoints publish finish")
        else:
            rospy.logerr("%s is not a file!",filename)

if __name__ == "__main__":
    LoadRead()