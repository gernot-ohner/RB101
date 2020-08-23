# Edge cases:
#
# pseudo code:
#
# Option A: basically cheating
# set n to a number
# split n into it's digits
# sum the digits
#
# Option B: rubyish (if Integer#digits didn't exist)
# set n to a number
# convert n to a string
# split the string into characters
# FOR EACH character IN characters
#   convert character to int
# sum the integers
#
# Option C: low tech
# SET n to a number
# SET m to n
# SET sum = 0
# WHILE m > 0
#   sum += m % 10
#   m = sum / 10
# return sum

def sum_a(number)
  return 0 if number.nil?

  number.digits.sum
end

def sum_b(number)
  return 0 if number.nil?

  number.to_s.chars.map(&:to_i).sum
end

def sum_c(number)
  return 0 if number.nil?

  m = number
  sum = 0
  while m.positive?
    sum += m % 10
    m /= 10
  end
  sum
end

puts sum_a(23) == 5
puts sum_a(496) == 19
puts sum_a(123_456_789) == 45


puts sum_b(23) == 5
puts sum_b(496) == 19
puts sum_b(123_456_789) == 45

puts sum_c(23) == 5
puts sum_c(496) == 19
puts sum_c(123_456_789) == 45
