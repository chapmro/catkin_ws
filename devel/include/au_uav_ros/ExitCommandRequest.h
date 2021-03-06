/* Software License Agreement (BSD License)
 *
 * Copyright (c) 2011, Willow Garage, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials provided
 *    with the distribution.
 *  * Neither the name of Willow Garage, Inc. nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * Auto-generated by genmsg_cpp from file /home/viki/catkin_ws/src/au_uav_ros/srv/ExitCommand.srv
 *
 */


#ifndef AU_UAV_ROS_MESSAGE_EXITCOMMANDREQUEST_H
#define AU_UAV_ROS_MESSAGE_EXITCOMMANDREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace au_uav_ros
{
template <class ContainerAllocator>
struct ExitCommandRequest_
{
  typedef ExitCommandRequest_<ContainerAllocator> Type;

  ExitCommandRequest_()
    : ids()  {
    }
  ExitCommandRequest_(const ContainerAllocator& _alloc)
    : ids(_alloc)  {
    }



   typedef std::vector<int16_t, typename ContainerAllocator::template rebind<int16_t>::other >  _ids_type;
  _ids_type ids;




  typedef boost::shared_ptr< ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;

}; // struct ExitCommandRequest_

typedef ::au_uav_ros::ExitCommandRequest_<std::allocator<void> > ExitCommandRequest;

typedef boost::shared_ptr< ::au_uav_ros::ExitCommandRequest > ExitCommandRequestPtr;
typedef boost::shared_ptr< ::au_uav_ros::ExitCommandRequest const> ExitCommandRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace au_uav_ros

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/hydro/share/std_msgs/cmake/../msg'], 'au_uav_ros': ['/home/viki/catkin_ws/src/au_uav_ros/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "013a5047a27160a1a3446df81f760177";
  }

  static const char* value(const ::au_uav_ros::ExitCommandRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x013a5047a27160a1ULL;
  static const uint64_t static_value2 = 0xa3446df81f760177ULL;
};

template<class ContainerAllocator>
struct DataType< ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "au_uav_ros/ExitCommandRequest";
  }

  static const char* value(const ::au_uav_ros::ExitCommandRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16[] ids\n\
";
  }

  static const char* value(const ::au_uav_ros::ExitCommandRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.ids);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct ExitCommandRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::au_uav_ros::ExitCommandRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::au_uav_ros::ExitCommandRequest_<ContainerAllocator>& v)
  {
    s << indent << "ids[]" << std::endl;
    for (size_t i = 0; i < v.ids.size(); ++i)
    {
      s << indent << "  ids[" << i << "]: ";
      Printer<int16_t>::stream(s, indent + "  ", v.ids[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // AU_UAV_ROS_MESSAGE_EXITCOMMANDREQUEST_H
