import serial
import csv
import time
import re

serial_port = "/dev/ttyUSB0"
serial_baud = 115200

GPS = serial.Serial(port=serial_port,baudrate=serial_baud)

while True:
    data_heading = None
    data_latlon = None
    data = GPS.readline().strip().decode("ascii")
    if data[0:6] == "$GPGGA":
        field_delimiter_regex = re.compile(r'[,*]')
        nmea_sentence = data.strip()
        z = re.match(r'(^\$GP|^\$GN|^\$GL|^\$IN).*\*[0-9A-Fa-f]{2}$',nmea_sentence)
        data_latlon = [data_latlon for data_latlon in field_delimiter_regex.split(nmea_sentence)]
        #print(data_latlon)
        t = time.strftime("%Y-%m-%d %H:%M:%S",time.localtime())
        with open("/home/li/graduation_design/data_getlatlon2.csv","a+") as f:
            writer = csv.writer(f)
            writer.writerow([t,data_latlon[2],data_latlon[4],data_latlon[7]])

    if data[0] == "#":
        data_heading = data.strip()
        data_heading = data_heading.split(';')
        data_heading = data_heading[0] + ',' + data_heading[1]
        data_heading = data_heading.split(',')
        #print(data_heading)

        t = time.strftime("%Y-%m-%d %H:%M:%S",time.localtime())
        with open("/home/li/graduation_design/data_getheading2.csv","a+") as f:
            writer = csv.writer(f)
            writer.writerow([t,round(float(data_heading[13]),2),data_heading[16],data_heading[20]])