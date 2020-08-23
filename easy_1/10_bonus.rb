#
#
#
# Pseudocode:
# IF bonus_paid
#
#
#


def calculate_bonus(salary, bonus_paid)
  bonus_paid ? salary * 0.5 : 0
end


# Test cases:
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000