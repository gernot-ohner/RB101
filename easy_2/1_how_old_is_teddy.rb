# def age(seed)
#   new_seed = Random.srand(seed)
#   random_number = Random.rand(20..100)
#   [random_number, new_seed]
# end

def age
  Random.rand(20..100)
end

def valid?(name)
  name !~ / */
end

def get_name
  end
  name
end

def teddys_age
  name = gets.chomp

  puts "#{name || 'Teddy'}  is #{age}"
end



teddys_age

