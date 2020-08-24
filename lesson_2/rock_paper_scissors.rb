# frozen_string_literal: true

WIN_AMOUNT = 5
VALID_CHOICES = %i[rock paper scissors lizard spock].freeze

X_BEATS_Y = {
  rock: %i[scissors lizard],
  paper: %i[rock spock],
  scissors: %i[paper lizard],
  lizard: %i[spock paper],
  spock: %i[rock scissors]
}.freeze

MESSAGES = {
  welcome: "Welcome to the worlds greatest rock paper scissors lizard spock tournament!
Man versus the Machine, until one of them has 5 wins!",
  player_wins: 'You win!',
  computer_wins: 'The computer wins!',
  tie: "It's a tie!",
  invalid_choice: "That's not a valid choice!",
  goodbye: 'Thank you for playing! Goodbye!'
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

def compute_results(player, computer)
  if win?(player, computer)
    :player_wins
  elsif win?(computer, player)
    :computer_wins
  else
    :tie
  end
end

def display_results(result, score)
  prompt MESSAGES[result]
  prompt "The current score is player: #{score[:player_wins]}, computer: #{score[:computer_wins]}"
end

def compute_score(score, result)
  score[result] = score[result] + 1
  score
end

def determine_winner(score)
  if score[:player_wins] >= WIN_AMOUNT
    'Player'
  elsif score[:computer_wins] >= WIN_AMOUNT
    'Computer'
  end
end

def retrieve_valid_choice
  loop do
    prompt("Choose one #{VALID_CHOICES.join(', ')}")
    choice = prefix_to_word(gets.chomp)

    return choice if valid_choice? choice

    prompt MESSAGES[:invalid_choice]
  end
end

def display_welcome
  prompt MESSAGES[:welcome]
end


def display_choices(computer_choice, player_choice)
  prompt "You chose #{player_choice}, computer chose #{computer_choice}"
end

def display_winner(winner)
  prompt "The #{winner} wins the grand tournament!"
end

def display_goodbye
  prompt MESSAGES[:goodbye]
end

def someone_won?(score)
  score[:player_wins] >= WIN_AMOUNT || score[:computer_wins] >= WIN_AMOUNT
end

def retrieve_choices
  player_choice = retrieve_valid_choice
  computer_choice = VALID_CHOICES.sample
  [computer_choice, player_choice]
end

def tournament
  score = { player_wins: 0, computer_wins: 0, tie: 0 }
  display_welcome
  until someone_won?(score)
    computer_choice, player_choice = retrieve_choices

    display_choices(computer_choice, player_choice)

    result = compute_results(player_choice, computer_choice)
    score = compute_score(score, result)
    display_results(result, score)
  end
  display_winner(determine_winner(score))
end

loop do

  tournament
  prompt 'Do you want to play another tournament?'
  answer = gets.chomp

  break unless answer.downcase.start_with? 'y'

end


display_goodbye
