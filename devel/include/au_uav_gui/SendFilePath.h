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
 * Auto-generated by gensrv_cpp from file /home/viki/catkin_ws/src/au_uav_gui/srv/SendFilePath.srv
 *
 */


#ifndef AU_UAV_GUI_MESSAGE_SENDFILEPATH_H
#define AU_UAV_GUI_MESSAGE_SENDFILEPATH_H

#include <ros/service_traits.h>


#include <au_uav_gui/SendFilePathRequest.h>
#include <au_uav_gui/SendFilePathResponse.h>


namespace au_uav_gui
{

struct SendFilePath
{

typedef SendFilePathRequest Request;
typedef SendFilePathResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SendFilePath
} // namespace au_uav_gui


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::au_uav_gui::SendFilePath > {
  static const char* value()
  {
    return "fe8131f61ada79495e0d839037fe5bd9";
  }

  static const char* value(const ::au_uav_gui::SendFilePath&) { return value(); }
};

template<>
struct DataType< ::au_uav_gui::SendFilePath > {
  static const char* value()
  {
    return "au_uav_gui/SendFilePath";
  }

  static const char* value(const ::au_uav_gui::SendFilePath&) { return value(); }
};


// service_traits::MD5Sum< ::au_uav_gui::SendFilePathRequest> should match 
// service_traits::MD5Sum< ::au_uav_gui::SendFilePath > 
template<>
struct MD5Sum< ::au_uav_gui::SendFilePathRequest>
{
  static const char* value()
  {
    return MD5Sum< ::au_uav_gui::SendFilePath >::value();
  }
  static const char* value(const ::au_uav_gui::SendFilePathRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::au_uav_gui::SendFilePathRequest> should match 
// service_traits::DataType< ::au_uav_gui::SendFilePath > 
template<>
struct DataType< ::au_uav_gui::SendFilePathRequest>
{
  static const char* value()
  {
    return DataType< ::au_uav_gui::SendFilePath >::value();
  }
  static const char* value(const ::au_uav_gui::SendFilePathRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::au_uav_gui::SendFilePathResponse> should match 
// service_traits::MD5Sum< ::au_uav_gui::SendFilePath > 
template<>
struct MD5Sum< ::au_uav_gui::SendFilePathResponse>
{
  static const char* value()
  {
    return MD5Sum< ::au_uav_gui::SendFilePath >::value();
  }
  static const char* value(const ::au_uav_gui::SendFilePathResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::au_uav_gui::SendFilePathResponse> should match 
// service_traits::DataType< ::au_uav_gui::SendFilePath > 
template<>
struct DataType< ::au_uav_gui::SendFilePathResponse>
{
  static const char* value()
  {
    return DataType< ::au_uav_gui::SendFilePath >::value();
  }
  static const char* value(const ::au_uav_gui::SendFilePathResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // AU_UAV_GUI_MESSAGE_SENDFILEPATH_H
