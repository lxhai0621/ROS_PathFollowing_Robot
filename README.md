# ROS_PathFollowing_Robot

## 项目简介
本项目使用纯追踪算法，使用RTK定位完成机器人路径跟踪任务。

## 项目的硬件组成
1. **RTK设备**：中海达UBase基站、中海达SKY2移动站及蘑菇天线。
2. **驱动设备**：中菱科技电机、中菱科技ZLAC8015D驱动器。
3. **上位机**：英伟达Jeston AGX Xavier。
4. **遥控器**：FUTABA遥控器及其配套接收机。

## Gazebo仿真
前往https://github.com/lxhai0621/ROS_BalanceCar_PathFollowing

## 项目说明
定位采用了ROS官方nmea功能包，修改了一部分以适配中海达\
程序需要准备好的路径信息\
硬件连接需要使用USB转串口工具将上位机与中海达SKY2移动站连接在一起，使用USB转RS485将上位机与中菱ZLAC8015D连接在一起\
项目使用的硬件即演示视频可在image文件夹下查看

## 安装使用步骤
### 1. 环境配置
- **操作系统**：Ubuntu20.04
- **ROS版本**：ros-noetic

### 2. 安装依赖包
- **scipy**：使用了其中的KDTree。
- **nmea_navset_driver**：获取GPS定位信息
```bash
# 安装scipy
pip install scipy
# 安装nmea_navset_driver
sudo apt-get install ros-melodic-nmea-navsat-driver libgps-dev
```
### 3.nmea_navset_driver说明
nmea_navsat_driver提供四个节点：nmea_topic_driver，nmea_serial_driver，nmea_topic_serial_reader和nmea_socket_driver\
- nmea_topic_serial_reader节点：此节点从串口读入GPS数据，然后封装为nmea_msgs/Sentence数据格式，发布话题nmea_sentence。
- nmea_topic_driver节点：此节点订阅话题nmea_sentence，然后根据NMEA0184协议解析，并发布解析后的数据，发布话题为：经纬度/fix，速度/vel，gps时间/time_reference和航向角/heading。
- nmea_serial_driver节点：此节点从串口读数据，直接解析发布数据，相当于nmea_topic_driver节点和nmea_topic_serial_reader节点的结合体。
github源码：https://github.com/ros-drivers/nmea_navsat_driver

### 4. 运行项目
- 配置好中海达UBase基准站。
- 修改`load_read.py`中csv路径文件。
- 运行`real_robot.launch`开始执行路径跟踪任务。
- 运行`remote_control.launch`可以使用遥控器控制机器人运动。
```bash
# 运行程序
roslaunch real_robot real_robot.launch
roslaunch real_robot remote_control.launch
```
