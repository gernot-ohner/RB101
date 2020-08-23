# frozen_string_literal: true

VALID_CHOICES = %i[rock paper scissors lizard spock].freeze

X_BEATS_Y = {
  rock: %i[scissors lizard],
  paper: %i[rock spock],
  scissors: %i[paper lizard],
  lizard: %i[spock paper],
  spock: %i[rock scissors]
}.freeze

MESSAGES = {
  player_wins: 'You win!',
  computer_wins: 'The computer wins!',
  tie: "It's a tie!",
  invalid_choice: "That's not a valid choice!",
  thanks: 'Thank you for playing!'
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
  if score[:player_wins] >= 5
    'Player'
  elsif score[:computer_wins] >= 5
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

score = { player_wins: 0, computer_wins: 0, tie: 0 }
loop do
  player_choice = retrieve_valid_choice
  computer_choice = VALID_CHOICES.sample

  prompt "You chose #{player_choice}, computer chose #{computer_choice}"

  result = compute_results(player_choice, computer_choice)
  score = compute_score(score, result)
  display_results(result, score)

  winner = determine_winner(score)
  unless winner.nil?
    prompt "#{winner} wins!"
    break
  end
end

prompt MESSAGES[:thanks]
