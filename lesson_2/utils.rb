def prompt(message)
  puts "=> #{message}"
end

def valid_number?(string)
  /^-?\d+(\.\d+)?$/ =~ string
end

def valid_name?(string)
  !string.nil? && !string.empty?
end

def messages
  MESSAGES
end

def retrieve_input(input_type)
  loop do
    prompt messages["input_#{input_type}".to_sym]
    input = gets.chomp
    return input if method("valid_#{input_type}?".to_sym).call(input)

    prompt messages["invalid_#{input_type}".to_sym]
  end
end
