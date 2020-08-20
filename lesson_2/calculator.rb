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
LANGUAGE = :de

def messages
  MESSAGES[LANGUAGE]
end

def prompt(message)
  puts "=> #{message}"
end

def valid_operator?(string)
  (1..4).include? string.to_i
end

def number?(string)
  /^-?\d+(\.\d+)?$/ =~ string
end

def valid_name?(string)
  !string.nil? && !string.empty?
end

def read_valid_number(message)
  loop do
    prompt message
    number = gets.chomp
    return number.to_f if number?(number)

    prompt messages[:invalid_number]
  end
end

def read_valid_operator
  loop do
    operator = gets.chomp
    return operator if valid_operator?(operator)

    prompt messages[:invalid_operator]
  end
end

def read_name
  loop do
    name = gets.chomp.strip
    return name if valid_name?(name)

    prompt messages[:invalid_name]
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

def read_inputs
  number1 = read_valid_number messages[:enter_first_number]
  number2 = read_valid_number messages[:enter_second_number]

  prompt messages[:operator_prompt]
  operator = read_valid_operator
  [number1, number2, operator]
end

def calculation
  number1, number2, operator = read_inputs

  prompt "#{messages[:operation][operator.to_sym]} #{messages[:the_two_numbers]}"
  result = compute(number1, number2, operator)
  puts result
end

def calculate_again?
  prompt messages[:calculate_again]
  answer = gets.chomp
  answer.downcase.start_with? 'y'
end

prompt messages[:welcome]
prompt messages[:name_please]
name = read_name
prompt "#{messages[:hello]} #{name}!"
loop do
  calculation
  break unless calculate_again?
end
prompt messages[:goodbye]
