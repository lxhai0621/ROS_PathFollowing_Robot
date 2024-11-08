// Generated by gencpp from file real_robot/Control.msg
// DO NOT EDIT!


#ifndef REAL_ROBOT_MESSAGE_CONTROL_H
#define REAL_ROBOT_MESSAGE_CONTROL_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Int32.h>
#include <std_msgs/Int32.h>

namespace real_robot
{
template <class ContainerAllocator>
struct Control_
{
  typedef Control_<ContainerAllocator> Type;

  Control_()
    : around()
    , about()  {
    }
  Control_(const ContainerAllocator& _alloc)
    : around(_alloc)
    , about(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Int32_<ContainerAllocator>  _around_type;
  _around_type around;

   typedef  ::std_msgs::Int32_<ContainerAllocator>  _about_type;
  _about_type about;





  typedef boost::shared_ptr< ::real_robot::Control_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::real_robot::Control_<ContainerAllocator> const> ConstPtr;

}; // struct Control_

typedef ::real_robot::Control_<std::allocator<void> > Control;

typedef boost::shared_ptr< ::real_robot::Control > ControlPtr;
typedef boost::shared_ptr< ::real_robot::Control const> ControlConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::real_robot::Control_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::real_robot::Control_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::real_robot::Control_<ContainerAllocator1> & lhs, const ::real_robot::Control_<ContainerAllocator2> & rhs)
{
  return lhs.around == rhs.around &&
    lhs.about == rhs.about;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::real_robot::Control_<ContainerAllocator1> & lhs, const ::real_robot::Control_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace real_robot

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::real_robot::Control_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::real_robot::Control_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::real_robot::Control_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::real_robot::Control_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::real_robot::Control_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::real_robot::Control_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::real_robot::Control_<ContainerAllocator> >
{
  static const char* value()
  {
    return "560db3b62e0e7f20a5607776494d55f7";
  }

  static const char* value(const ::real_robot::Control_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x560db3b62e0e7f20ULL;
  static const uint64_t static_value2 = 0xa5607776494d55f7ULL;
};

template<class ContainerAllocator>
struct DataType< ::real_robot::Control_<ContainerAllocator> >
{
  static const char* value()
  {
    return "real_robot/Control";
  }

  static const char* value(const ::real_robot::Control_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::real_robot::Control_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Int32 around\n"
"std_msgs/Int32 about\n"
"================================================================================\n"
"MSG: std_msgs/Int32\n"
"int32 data\n"
;
  }

  static const char* value(const ::real_robot::Control_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::real_robot::Control_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.around);
      stream.next(m.about);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Control_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::real_robot::Control_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::real_robot::Control_<ContainerAllocator>& v)
  {
    s << indent << "around: ";
    s << std::endl;
    Printer< ::std_msgs::Int32_<ContainerAllocator> >::stream(s, indent + "  ", v.around);
    s << indent << "about: ";
    s << std::endl;
    Printer< ::std_msgs::Int32_<ContainerAllocator> >::stream(s, indent + "  ", v.about);
  }
};

} // namespace message_operations
} // namespace ros

#endif // REAL_ROBOT_MESSAGE_CONTROL_H
