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

class Control {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.around = null;
      this.about = null;
    }
    else {
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
    // Serializes a message object of type Control
    // Serialize message field [around]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.around, buffer, bufferOffset);
    // Serialize message field [about]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.about, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Control
    let len;
    let data = new Control(null);
    // Deserialize message field [around]
    data.around = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [about]
    data.about = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'real_robot/Control';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '560db3b62e0e7f20a5607776494d55f7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Int32 around
    std_msgs/Int32 about
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
    const resolved = new Control(null);
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

module.exports = Control;
