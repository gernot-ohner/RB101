# frozen_string_literal: true

# Edge cases:
# - Q: What if the number is 0 or negative?
#   A: return an empty string
#
#
# Pseudo code
# SET n to a positive integer
# SET result = ''
# IF n == 0
#   return ''
# ELSE
#   FOR EACH i FROM 0 TO n - 1
#     IF i is even
#       result += "1"
#     ELSE
#       result += "0"
#     END
#   END
# END
# return result

def get_elements(starter)
  if starter == '1'
    { even: '1', odd: '0' }
  else
    { even: '0', odd: '1' }
  end
end

def stringy(length, starter = '1')
  return '' if length.nil? || length.zero?
  return '' unless ['0','1'].include? starter

  elements = get_elements(starter)

  (0...length).map do |i|
    if i.even?
      elements[:even]
    else
      elements[:odd]
    end
  end.join
end

# Test cases
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(6, '1') == '101010'
puts stringy(9, '1') == '101010101'
puts stringy(4, '1') == '1010'
puts stringy(7, '1') == '1010101'

puts stringy(6, '0') == '010101'
puts stringy(9, '0') == '010101010'
puts stringy(4, '0') == '0101'
puts stringy(7, '0') == '0101010'


# Further considerations:
# One advantage of the official solution
# def stringy(size)
#   numbers = []
#
#   size.times do |index|
#     number = index.even? ? 1 : 0
#     numbers << number
#   end
#
#   numbers.join
# end
#
# compared to mine, is that in mine,
