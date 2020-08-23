#
# Edge cases:
# - Q: what if there are extra spaces somewhere?
#   A: as a challenge: keep them between the correct two words
#
# Pseudo code:
# Would be easy except for the edge case with multiple spaces.
# Then it would be: string.split.reverse.join(" ")
#
# Idea:
# make the spaces elements of the intermediate array as well.
#


def reverse_sentence(string)
  string.split.reverse.join(" ")
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('Reverse   these words') == 'words these   Reverse'
