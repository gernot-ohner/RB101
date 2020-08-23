# Edge cases:
# - Q: What if there are multiple spaces between the words?
#   A: You can throw that information away.
#      The result only needs to have one space between each word
# - Q: How should I deal with spaces?
#   A: Spaces should be included only if more than one word is present
#
# Pseudo code:
#
# Option A: low tech
# SET sentence to a string
# SET words = []
# SET i = 0
# SET j = 0
# WHILE i < sentence.length
#   IF sentence[i] != " "
#     i += 1
#   ELSE
#     words << sentence[j...i]
#     i, j = i + 1, i
#   END
# END
#
# Option B: sane
# accept a sentence
# split the sentence into words
# FOR EACH word IN words
#   reverse the word if its longer than 5 characters
# join the words

def low_tech_split(sentence)
  words = []
  i, j = 0

  while i < sentence.length
    if sentence[i] == ' '
      i += 1
    else
      words << sentence[j..i]
      "asdf".
      sentence = sentence.
      i += 1
      j = i
    end
  end
  words
end

# p low_tech_split "this is a sentence with lots of words!"

def reverse_word_if_long(word)
  if word.length >= 5
    word.chars.reverse.join
  else
    word
  end
end

def reverse_words(sentence)
  sentence.split.map { |word| reverse_word_if_long(word) }.join(' ')
end

# Test Cases
p reverse_words('Professional')          == "lanoisseforP"
p reverse_words('Walk around the block') == "Walk dnuora the kcolb"
p reverse_words('Launch School')         == "hcnuaL loohcS"

p reverse_words('Professional')          # == "lanoisseforP"
p reverse_words('Walk around the block') # == "Walk dnuora the kcolb"
p reverse_words('Launch School')         # == "hcnuaL loohcS"
