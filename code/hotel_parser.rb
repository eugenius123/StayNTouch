require 'yaml'

class HotelParser
  # Implement a method parse the contents of a YAML file and return
  # an object whose values are accessible using the [] operator or method calls
  #
  # Note: Use of the YAML library is fine (encouraged, even) but please don't
  #       use any third-party gems that enable the required functionality.
  
  # Since OpenStruct was not allowed to be used, the only structure available that allows the [] operator and
  # . method calls was the Struct object and thus that is what I used to solve this problem. After trying to
  # use Open Struct Which is easy to code but runs really slowly and writing my own custom classes which can't
  # be called using the [] operator, Struct were used for code cleanliness and ability to use [] operator

  def self.parse(filename)
    hash = YAML.load_file(filename)
    hotel_struct = Struct.new(:hotels)
    hotel_obj = hotel_struct.new(traverse_hotels(hash["hotels"]))
    return hotel_obj
  end

  #helper method to traverse and create structs objects for hotels
  def self.traverse_hotels(h)
    hotels = []
    h.each do |val|
      hotel_struct = Struct.new(:name,:rooms)
      new_hotel = hotel_struct.new(val['name'],traverse_rooms(val['rooms']))
      hotels.push(new_hotel)
    end
    return hotels
  end

  #helper method to traverse and create struct objects for rooms
  def self.traverse_rooms(r)
    rooms = []
    r.each do |r|
      room_struct = Struct.new(:name,:amenities)
      new_room = room_struct.new(r['name'],r['amenities'])
      rooms.push(new_room)
    end
    return rooms
  end
  
end
