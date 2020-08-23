# frozen_string_literal: true

METERS_PER_FOOT = 0.3048

class MeasurementUnit
  attr_accessor :magnitude

  def initialize(magnitude)
    self.magnitude = magnitude
  end
end

class Meter < MeasurementUnit
  def to_foot
    foot_value = magnitude / METERS_PER_FOOT
    Foot.new(foot_value)
  end
end

class Foot < MeasurementUnit
  def to_meter
    meter_value = magnitude * METERS_PER_FOOT
    Meter.new(meter_value)
  end
end

class Room
  # width and breadth are in meters
  attr_accessor :width, :breadth

  def initialize(width, breadth)
    self.width = Meter.new(width)
    self.breadth = Meter.new(breadth)
  end

  def size_in_meters
    width.magnitude * breadth.magnitude
  end

  def size_in_feet
    width.to_foot.magnitude * breadth.to_foot.magnitude
  end
end

def get_dimensions
  puts 'Enter the width in meters'
  width = gets.chomp.to_f
  puts 'Enter the breadth in meters'
  breadth = gets.chomp.to_f
  [width, breadth]
end

def main
  width, breadth = get_dimensions
  room = Room.new(width, breadth)

  puts format('The area of the room is %.2f square meters (%.2f square feet).',
              room.size_in_meters, room.size_in_feet)
end

main