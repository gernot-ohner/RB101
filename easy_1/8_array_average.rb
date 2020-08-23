
# compute the "average" of the numbers in the array, via integer division
# pseudo code:
#
# Option A: low tech
# SET numbers to an array of numbers
# SET sum = 0
# FOR EACH number IN numbers
#   add number to sum
# divide sum by length of numbers
#
# Option B: normal

def low_tech_average(numbers)
  return 0 if numbers.nil? || numbers.empty?

  sum = 0
  numbers.each do |number|
    sum += number
  end

  sum / numbers.length
end

def average(numbers)
  return 0 if numbers.nil? || numbers.empty?

  numbers.sum / numbers.length
end


# Test cases

puts low_tech_average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts low_tech_average([1, 5, 87, 45, 8, 8]) == 25
puts low_tech_average([9, 47, 23, 95, 16, 52]) == 40

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40


# Further exploration:
# if a Float return value is desired, use numbers.sum.to_f / numbers.length