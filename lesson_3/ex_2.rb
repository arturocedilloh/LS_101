# Question 1
puts ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.key?("Spot")
puts ages.member?("Spot")
puts ages.include?("Spot")

# Question 2
puts "==================Question 2======================="
puts munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.sub('Munsters', 'munsters')
puts munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.capitalize!
puts munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.swapcase!
puts munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.downcase!
puts munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.upcase!

# Question 3
puts "==================Question 3======================="
puts ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
puts additional_ages = { "Marilyn" => 22, "Spot" => 237 }

puts ages.merge!(additional_ages)

# Question 4
puts "==================Question 4======================="
puts advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.match("Dino")
puts advice.include?("Dino")

# Question 5
puts "==================Question 5======================="
puts flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

puts flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 6
puts "==================Question 6======================="
puts flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones << "Dino"

# Question 7
puts "==================Question 7======================="
puts flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
puts flintstones.concat('Dino', 'Happy')
puts flintstones.concat(%w(Dino Happy))
puts flintstones.push("Dino").push("Hoppy")

# Question 8
puts "==================Question 8======================="
puts advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice!(0, advice.index('house'))

# Question 9
puts "==================Question 9======================="
statement = "The Flintstones Rock!"
statement.count('t')
