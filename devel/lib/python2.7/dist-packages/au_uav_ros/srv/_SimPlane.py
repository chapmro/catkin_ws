"""autogenerated by genpy from au_uav_ros/SimPlaneRequest.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class SimPlaneRequest(genpy.Message):
  _md5sum = "8e400108a855ff68f697fe3694dccfba"
  _type = "au_uav_ros/SimPlaneRequest"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """bool clear
int16 planeID
bool add
float64[] latitudes
float64[] longitudes
float64[] altitudes
int32 size

"""
  __slots__ = ['clear','planeID','add','latitudes','longitudes','altitudes','size']
  _slot_types = ['bool','int16','bool','float64[]','float64[]','float64[]','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       clear,planeID,add,latitudes,longitudes,altitudes,size

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(SimPlaneRequest, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.clear is None:
        self.clear = False
      if self.planeID is None:
        self.planeID = 0
      if self.add is None:
        self.add = False
      if self.latitudes is None:
        self.latitudes = []
      if self.longitudes is None:
        self.longitudes = []
      if self.altitudes is None:
        self.altitudes = []
      if self.size is None:
        self.size = 0
    else:
      self.clear = False
      self.planeID = 0
      self.add = False
      self.latitudes = []
      self.longitudes = []
      self.altitudes = []
      self.size = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_struct_BhB.pack(_x.clear, _x.planeID, _x.add))
      length = len(self.latitudes)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.pack(pattern, *self.latitudes))
      length = len(self.longitudes)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.pack(pattern, *self.longitudes))
      length = len(self.altitudes)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.pack(pattern, *self.altitudes))
      buff.write(_struct_i.pack(self.size))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 4
      (_x.clear, _x.planeID, _x.add,) = _struct_BhB.unpack(str[start:end])
      self.clear = bool(self.clear)
      self.add = bool(self.add)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.latitudes = struct.unpack(pattern, str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.longitudes = struct.unpack(pattern, str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.altitudes = struct.unpack(pattern, str[start:end])
      start = end
      end += 4
      (self.size,) = _struct_i.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_BhB.pack(_x.clear, _x.planeID, _x.add))
      length = len(self.latitudes)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.latitudes.tostring())
      length = len(self.longitudes)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.longitudes.tostring())
      length = len(self.altitudes)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.altitudes.tostring())
      buff.write(_struct_i.pack(self.size))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 4
      (_x.clear, _x.planeID, _x.add,) = _struct_BhB.unpack(str[start:end])
      self.clear = bool(self.clear)
      self.add = bool(self.add)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.latitudes = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.longitudes = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.altitudes = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (self.size,) = _struct_i.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_i = struct.Struct("<i")
_struct_BhB = struct.Struct("<BhB")
"""autogenerated by genpy from au_uav_ros/SimPlaneResponse.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class SimPlaneResponse(genpy.Message):
  _md5sum = "eca8b96616c32aacf1be8bbf14c70eba"
  _type = "au_uav_ros/SimPlaneResponse"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """string error


"""
  __slots__ = ['error']
  _slot_types = ['string']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       error

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(SimPlaneResponse, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.error is None:
        self.error = ''
    else:
      self.error = ''

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self.error
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.error = str[start:end].decode('utf-8')
      else:
        self.error = str[start:end]
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.error
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.error = str[start:end].decode('utf-8')
      else:
        self.error = str[start:end]
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
class SimPlane(object):
  _type          = 'au_uav_ros/SimPlane'
  _md5sum = '6f87339775e7e8ada29616282172e07b'
  _request_class  = SimPlaneRequest
  _response_class = SimPlaneResponse
