# Rough sketch
# 1. tally the elements of the array
# 2. print the result in the desired format
#
# Edge cases:
# - Q: What if the input is empty?
#   A: make the output empty as well.
# - Q: Should the method be case sensitive?
#   A: yes, SUV != suv
# - Q: What if the input array contains things that aren't strings?
#   A: your methods should be able to deal with that. During the printing step, print it's string representation
#
# Pseudo code:
# Option A:
#   start with an empty list.
#   for each element of the input array
#     if the element is already a key in the list
#       get the corresponding value and increase it by 1
#     else
#       put the { element => 1 } in the map
#
# Option B:
#   From Ruby 2.7 onwards, use Enumerable#tally
#
#
# for each <k, v> pair in the list, print
# "k => v\n"
def tally(list)
  counts = {}
  list.each do |element|
    if counts.key? element
      counts[element] = counts[element] + 1
    else
      counts[element] = 1
    end
  end
  counts
end

def print_map(map)
  map.each do |key, value|
    puts "#{key} => #{value}\n"
  end
end

print_map tally(%w[car car truck car SUV truck motorcycle motorcycle car truck])
print_map tally(["car", 123, :hey, [1, 2, 3], [1, 2, 3], :hey])

# Test cases
p tally([]) == {}
p tally([1, 2, 1, 1, 3]) == {1 => 3, 2 => 1, 3 => 1}
p tally(%w[car car truck car SUV truck motorcycle motorcycle car truck]) == {"car" => 4, "truck" => 3, "SUV" => 1, "motorcycle" => 2}
p tally(["car", 123, :hey, [1, 2, 3], [1, 2, 3], :hey]) == {"car" => 1, 123 => 1, :hey => 2, [1, 2, 3] => 2}

# Further Exploration
def case_insensitive_tally(list)
  # this only makes sense for strings
  # return unless list.all? { |element| element.is_a? String  }

  counts = {}
  list.each do |element|
    counts.update({element.downcase => 1}) { |_, v1, v2| v1 + v2}
  end
  counts
end

p case_insensitive_tally([]) == {}
p case_insensitive_tally(%w[car car truck car SUV truck motorcycle motorcycle car truck]) == {"car" => 4, "truck" => 3, "suv" => 1, "motorcycle" => 2}
p case_insensitive_tally(%w[car car suv truck CAR SUV truck motorcycle motorcycle car truck]) == {"car" => 4, "truck" => 3, "suv" => 2, "motorcycle" => 2}
