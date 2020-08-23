# frozen_string_literal: true

VALID_CHOICES = %i[rock paper scissors lizard spock].freeze

X_BEATS_Y = {
  rock: %i[scissors lizard],
  paper: %i[rock spock],
  scissors: %i[paper lizard],
  lizard: %i[spock paper],
  spock: %i[rock scissors]
}.freeze

def construct_prefixes(symbol)
  (0...symbol.to_s.length).map { |i| symbol.to_s[0..i] }
end

def disambiguate_prefixes(prefixes)
  tallies = prefixes.values.flatten.tally
  duplicates = tallies.select { |_, v| v > 1 }.keys
  prefixes.transform_values { |v| v.difference(duplicates) }
end

def unambiguous_prefixes(symbols)
  prefixes = symbols.to_h { |choice| [choice, construct_prefixes(choice)] }
  disambiguate_prefixes(prefixes).freeze
end

PREFIXES = unambiguous_prefixes(VALID_CHOICES)


def prompt(message)
  puts "=> #{message}"
end

def prefix_to_word(prefix)
  PREFIXES.find { |_, v| v.include? prefix }&.first || :invalid
end

def valid_choice?(string)
  VALID_CHOICES.include? string.downcase
end

def win?(player, computer)
  X_BEATS_Y[player.to_sym].include? computer.to_sym
end

def display_results(player, computer)
  if win?(player, computer)
    prompt 'You won!'
  elsif win?(computer, player)
    prompt 'Computer won!'
  else
    prompt "It's a tie!"
  end
end

def retrieve_valid_choice
  loop do
    prompt("Choose one #{VALID_CHOICES.join(', ')}")
    choice = prefix_to_word(gets.chomp)

    return choice if valid_choice? choice

    prompt("That's not a valid choice")
  end
end

loop do
  choice = retrieve_valid_choice

  computer_choice = VALID_CHOICES.sample

  prompt "You chose #{choice}, computer chose #{computer_choice}"

  display_results(choice, computer_choice)

  prompt 'Do you want to play again?'

  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt 'Thank you for playing!'
