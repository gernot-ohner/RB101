# Edge cases:
# - Q: What to do when the input number is negative?
#   A: print nothing
# - Q: What do print when the number is zero? print empty string or nothing?
#   A: print nothing.
# - Q: What if the inputs have the wrong types?
#   A: you don't have to deal with that
#
# Other questions:
# - Q: Should the method return a newline separated string or print to stdout?
#   A: return a newline separated string. Don't have side effect's willy-nilly in your program.
# - Q: should there be a newline after the last line?
#   A: no
#
# Pseudo Code:
# for each number from 1 to n
#   print the string
#

def repeat(string, n)
  return if n <= 0
  i = 0
  result = ""
  until i == n
    if i == n - 1
      result << string
    else
      result << string << "\n"
    end
    i += 1
  end
  result
end

def better_repeat(string, n)
  return if n <= 0
  (1..n).reduce("") { |accumulator, _| accumulator + "#{string}\n" }.chomp
end

puts repeat("what's up? ", 3)

# Test cases:
p repeat("hi", 0) == nil
p repeat("hi", 1) == "hi"
p repeat("hi", -10) == nil
p repeat("hi", 3) == "hi\nhi\nhi"
p repeat("what's up? ", 3) == "what's up? \nwhat's up? \nwhat's up? "


p better_repeat("hi", 0) == nil
p better_repeat("hi", 1) == "hi"
p better_repeat("hi", -10) == nil
p better_repeat("hi", 3) == "hi\nhi\nhi"
p better_repeat("what's up? ", 3) == "what's up? \nwhat's up? \nwhat's up? "

