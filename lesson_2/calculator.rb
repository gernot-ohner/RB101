# frozen_string_literal: true

# pseudo code
#
# 1. ask the user for two numbers
# 2. ask the user for an operation to perform
# 3. perform the operation on the two numbers
# 4. output the result

require 'json'
file = File.read('./messages.json')
MESSAGES = JSON.parse(file, symbolize_names: true)

def prompt(message)
  puts "=> #{message}"
end

def valid_language?(string)
  %(en de).include? string.downcase
end

def retrieve_language
  loop do
    prompt MESSAGES[:input_language]
    input = gets.chomp
    return input.to_sym if valid_language?(input)

    prompt MESSAGES[:invalid_language]
  end
end

def messages
  MESSAGES[LANGUAGE]
end

def valid_operator?(string)
  (1..4).include? string.to_i
end

def valid_number?(string)
  /^-?\d+(\.\d+)?$/ =~ string
end

def valid_name?(string)
  !string.nil? && !string.empty?
end

def valid_repetition_answer?(string)
  (messages[:true_repetition_answers] + messages[:false_repetition_answers])
    .include?(string.downcase)
end

def retrieve_input(input_type)
  loop do
    prompt messages["input_#{input_type}".to_sym]
    input = gets.chomp
    return input if method("valid_#{input_type}?".to_sym).call(input)

    prompt messages["invalid_#{input_type}".to_sym]
  end
end

def compute(number1, number2, operator)
  case operator
  when '1'
    number1 + number2
  when '2'
    number1 - number2
  when '3'
    number1 * number2
  when '4'
    number1 / number2
  end
end

def retrieve_inputs
  number1 = retrieve_input('number').to_f
  number2 = retrieve_input('number').to_f
  operator = retrieve_input('operator')
  [number1, number2, operator]
end

def calculate_again?
  answer = retrieve_input('repetition_answer')
  messages[:true_repetition_answers].include? answer.downcase
end

LANGUAGE = retrieve_language
prompt messages[:welcome]
name = retrieve_input('name')
prompt "#{messages[:hello]} #{name}!"

loop do
  number1, number2, operator = retrieve_inputs
  prompt "#{messages[:operation][operator.to_sym]} #{messages[:the_two_numbers]}"
  result = compute(number1, number2, operator)
  puts result
  break unless calculate_again?
end
prompt messages[:goodbye]
