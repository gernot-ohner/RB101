# frozen_string_literal: true

VALID_CHOICES = %w[rock paper scissors].freeze

def prompt(message)
  puts "=> #{message}"
end

def valid_choice?(string)
  VALID_CHOICES.include? string.downcase
end

def win?(player, computer)
  (player == 'rock' && computer == 'scissors') ||
    (player == 'paper' && computer == 'rock') ||
    (player == 'scissors' && computer == 'paper')
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

loop do
  choice = ''
  loop do
    prompt("Choose one #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    break if valid_choice? choice

    prompt("That's not a valid choice")
  end

  computer_choice = VALID_CHOICES.sample
  p computer_choice

  prompt "You chose #{choice}, computer chose #{computer_choice}"

  display_results(choice, computer_choice)

  prompt 'Do you want to play again?'

  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt 'Thank you for playing!'
