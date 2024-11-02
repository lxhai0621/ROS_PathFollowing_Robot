# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "real_robot: 3 messages, 0 services")

set(MSG_I_FLAGS "-Ireal_robot:/home/li/graduation_design/src/real_robot/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(real_robot_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/Lane.msg" NAME_WE)
add_custom_target(_real_robot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "real_robot" "/home/li/graduation_design/src/real_robot/msg/Lane.msg" "std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Twist:geometry_msgs/Vector3:geometry_msgs/TwistStamped:geometry_msgs/PoseStamped:real_robot/Waypoint:geometry_msgs/Point:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/Waypoint.msg" NAME_WE)
add_custom_target(_real_robot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "real_robot" "/home/li/graduation_design/src/real_robot/msg/Waypoint.msg" "std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Twist:geometry_msgs/Vector3:geometry_msgs/TwistStamped:geometry_msgs/PoseStamped:geometry_msgs/Point:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/ControllerMsg.msg" NAME_WE)
add_custom_target(_real_robot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "real_robot" "/home/li/graduation_design/src/real_robot/msg/ControllerMsg.msg" "std_msgs/Header:std_msgs/Int32"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(real_robot
  "/home/li/graduation_design/src/real_robot/msg/Lane.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/li/graduation_design/src/real_robot/msg/Waypoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/real_robot
)
_generate_msg_cpp(real_robot
  "/home/li/graduation_design/src/real_robot/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/real_robot
)
_generate_msg_cpp(real_robot
  "/home/li/graduation_design/src/real_robot/msg/ControllerMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/real_robot
)

### Generating Services

### Generating Module File
_generate_module_cpp(real_robot
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/real_robot
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(real_robot_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(real_robot_generate_messages real_robot_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/Lane.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_cpp _real_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/Waypoint.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_cpp _real_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/ControllerMsg.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_cpp _real_robot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(real_robot_gencpp)
add_dependencies(real_robot_gencpp real_robot_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS real_robot_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(real_robot
  "/home/li/graduation_design/src/real_robot/msg/Lane.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/li/graduation_design/src/real_robot/msg/Waypoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/real_robot
)
_generate_msg_eus(real_robot
  "/home/li/graduation_design/src/real_robot/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/real_robot
)
_generate_msg_eus(real_robot
  "/home/li/graduation_design/src/real_robot/msg/ControllerMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/real_robot
)

### Generating Services

### Generating Module File
_generate_module_eus(real_robot
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/real_robot
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(real_robot_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(real_robot_generate_messages real_robot_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/Lane.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_eus _real_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/Waypoint.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_eus _real_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/ControllerMsg.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_eus _real_robot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(real_robot_geneus)
add_dependencies(real_robot_geneus real_robot_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS real_robot_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(real_robot
  "/home/li/graduation_design/src/real_robot/msg/Lane.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/li/graduation_design/src/real_robot/msg/Waypoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/real_robot
)
_generate_msg_lisp(real_robot
  "/home/li/graduation_design/src/real_robot/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/real_robot
)
_generate_msg_lisp(real_robot
  "/home/li/graduation_design/src/real_robot/msg/ControllerMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/real_robot
)

### Generating Services

### Generating Module File
_generate_module_lisp(real_robot
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/real_robot
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(real_robot_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(real_robot_generate_messages real_robot_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/Lane.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_lisp _real_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/Waypoint.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_lisp _real_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/ControllerMsg.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_lisp _real_robot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(real_robot_genlisp)
add_dependencies(real_robot_genlisp real_robot_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS real_robot_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(real_robot
  "/home/li/graduation_design/src/real_robot/msg/Lane.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/li/graduation_design/src/real_robot/msg/Waypoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/real_robot
)
_generate_msg_nodejs(real_robot
  "/home/li/graduation_design/src/real_robot/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/real_robot
)
_generate_msg_nodejs(real_robot
  "/home/li/graduation_design/src/real_robot/msg/ControllerMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/real_robot
)

### Generating Services

### Generating Module File
_generate_module_nodejs(real_robot
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/real_robot
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(real_robot_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(real_robot_generate_messages real_robot_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/Lane.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_nodejs _real_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/Waypoint.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_nodejs _real_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/ControllerMsg.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_nodejs _real_robot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(real_robot_gennodejs)
add_dependencies(real_robot_gennodejs real_robot_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS real_robot_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(real_robot
  "/home/li/graduation_design/src/real_robot/msg/Lane.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/li/graduation_design/src/real_robot/msg/Waypoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/real_robot
)
_generate_msg_py(real_robot
  "/home/li/graduation_design/src/real_robot/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/real_robot
)
_generate_msg_py(real_robot
  "/home/li/graduation_design/src/real_robot/msg/ControllerMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/real_robot
)

### Generating Services

### Generating Module File
_generate_module_py(real_robot
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/real_robot
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(real_robot_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(real_robot_generate_messages real_robot_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/Lane.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_py _real_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/Waypoint.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_py _real_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/graduation_design/src/real_robot/msg/ControllerMsg.msg" NAME_WE)
add_dependencies(real_robot_generate_messages_py _real_robot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(real_robot_genpy)
add_dependencies(real_robot_genpy real_robot_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS real_robot_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/real_robot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/real_robot
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(real_robot_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(real_robot_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(real_robot_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/real_robot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/real_robot
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(real_robot_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(real_robot_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(real_robot_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/real_robot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/real_robot
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(real_robot_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(real_robot_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(real_robot_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/real_robot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/real_robot
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(real_robot_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(real_robot_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(real_robot_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/real_robot)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/real_robot\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/real_robot
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(real_robot_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(real_robot_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(real_robot_generate_messages_py sensor_msgs_generate_messages_py)
endif()
