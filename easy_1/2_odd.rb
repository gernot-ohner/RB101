# Input: 1 integer
# Output: 1 boolean
#
# Pseudo code:
# take the absolute value of the number
# check if the absolute number is divisible by two without remainder
#   if yes: return false
#   if not: return true
#
# Edge cases:
# Q: What if the number is huge?
# A: should still work (well, it's ruby, so don't worry)

def is_odd?(n)
  (n > 0 ? n : -n) % 2 == 1
end

# Test cases
p is_odd?(0) == false
p is_odd?(1) == true
p is_odd?(10) == false
p is_odd?(-10) == false
p is_odd?(-901) == true
p is_odd?(10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) == false
p is_odd?( -10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) == false


# Further thoughts/exploration:
# % in Ruby is a modulo operator, not a remainder operator.
# That means it has the desired behavior for negative numbers anyway, even without taking the absolute value.

def is_other_odd?(n)
  (n > 0 ? n : -n).remainder(2) == 1
end

p is_other_odd?(0) == false
p is_other_odd?(1) == true
p is_other_odd?(10) == false
p is_other_odd?(-10) == false
p is_other_odd?(-901) == true
p is_other_odd?(10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) == false
p is_other_odd?(-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) == false

