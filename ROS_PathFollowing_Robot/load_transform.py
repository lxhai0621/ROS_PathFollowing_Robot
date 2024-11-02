#! usr/bin/env python

import pymap3d as pm
import numpy as np
import csv
import pandas as pd

lat1,lon1 = 40.48705108, 111.77798358
lat2,lon2 = 40.48703381, 111.77790065
h1 = 0

num_points = 10

d_lat = lat2 - lat1
d_lon = lon2 - lon1

lats = np.linspace(lat1, lat2, num_points)
lons = np.linspace(lon1, lon2, num_points)

latlon_list = []
new_point = []


for lat, lon in zip(lats, lons):
	this = [round(lat,8),round(lon,8)]
	latlon_list.append(this)
	#print(f"{round(lat,8)},{round(lon,8)}")
data1 = pd.DataFrame(latlon_list)
data1.to_csv("LLA_load.csv",index=False,header=False)


with open("/home/li/graduation_design/LLA_load.csv") as f:
	reader = csv.DictReader(f,['x','y'])
	for point in reader:
		new = pm.geodetic2enu(float(point['x']),float(point['y']),0,lat1,lon1,h1)
		new_point.append(new)
data2 = pd.DataFrame(new_point)
data2.to_csv("load.csv",index=False,header=False)



