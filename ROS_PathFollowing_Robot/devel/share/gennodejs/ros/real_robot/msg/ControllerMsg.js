// Auto-generated. Do not edit!

// (in-package real_robot.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ControllerMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.around = null;
      this.about = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('around')) {
        this.around = initObj.around
      }
      else {
        this.around = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('about')) {
        this.about = initObj.about
      }
      else {
        this.about = new std_msgs.msg.Int32();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControllerMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [around]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.around, buffer, bufferOffset);
    // Serialize message field [about]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.about, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControllerMsg
    let len;
    let data = new ControllerMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [around]
    data.around = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [about]
    data.about = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'real_robot/ControllerMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd311acc178140cf7a23ce6368d21fe8e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    std_msgs/Int32 around
    std_msgs/Int32 about
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: std_msgs/Int32
    int32 data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControllerMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.around !== undefined) {
      resolved.around = std_msgs.msg.Int32.Resolve(msg.around)
    }
    else {
      resolved.around = new std_msgs.msg.Int32()
    }

    if (msg.about !== undefined) {
      resolved.about = std_msgs.msg.Int32.Resolve(msg.about)
    }
    else {
      resolved.about = new std_msgs.msg.Int32()
    }

    return resolved;
    }
};

module.exports = ControllerMsg;
