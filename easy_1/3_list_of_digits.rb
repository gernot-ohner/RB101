# Input: Int
# Output: List<Int>
#
# Edge cases:
# - Q: What should I do if he number is negative?
#   A: return a list of the *digits*, ignoring the minus sign
# - Q: What if the number is in a different base than 10?
#   A: You can assume that the number is in base 10
#
# Pseudo code
# Option A:
# use the Numeric#digits method (and reverse)
#
# Option B:
# Convert the number to a string
# Split the string into characters
# Convert the characters back to numbers
#
# Option C:
# get an empty array
# while n is not zero
#   get the last digit by computing n % 10
#   add that digit to the front of the array
#   set n to (n / 10)

def digit_list_a(n)
  n.digits.reverse
end

def digit_list_b(n)
  n.to_s.chars.map(&:to_i)
end

def digit_list_c(n)
  m = n
  digits = []
  while m > 0
    m, rest = m.divmod 10
    digits.unshift rest
  end
  digits
end


# Test cases
puts digit_list_a(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list_a(7) == [7]                     # => true
puts digit_list_a(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list_a(444) == [4, 4, 4]             # => true

puts digit_list_b(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list_b(7) == [7]                     # => true
puts digit_list_b(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list_b(444) == [4, 4, 4]             # => true

puts digit_list_c(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list_c(7) == [7]                     # => true
puts digit_list_c(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list_c(444) == [4, 4, 4]             # => true