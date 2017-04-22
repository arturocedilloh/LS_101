=begin

#Excercise 1 -----------------------------------------------------
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
print flintstones_hash

puts

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

counter = 0
result2 = flintstones.each_with_object({}) do |name, flintstones_hash|
  flintstones_hash[name] = counter
  counter += 1
end
#print result2
print flintstones_hash
puts


#Excercise 2 -----------------------------------------------------

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages_count = 0
ages.each do |k,v|
  ages_count += v
end
puts "All ages add up to #{ages_count} years"

#Excercise 3 -----------------------------------------------------

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject {|k,v| v > 100}


#Excercise 4 -----------------------------------------------------
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.min

#Excercise 5 -----------------------------------------------------
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
counter = 0
flintstones.each do |value|
  puts "#{value[0]}#{value[1]}"
  if (value[0] == "B") && (value[1] == "e")
    print counter
    break
  end
  counter += 1
end

flintstones.index { |name| name[0, 2] == "Be" }

#Excercise 6 -----------------------------------------------------
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! {|value| value[0,3]}

print flintstones

#Excercise 7 -----------------------------------------------------
statement = "The Flintstones Rock"
hsh={}
statement.split("").each do |value|
  if hsh.include?(value)
    hsh[value] += 1
  else
    hsh[value] = 1
  end
end

print hsh

#Excercise 9 -----------------------------------------------------
words = "the flintstones rock"
p words.split(" ").map { |value| value.capitalize}.join(' ')

=end
#Excercise 10 -----------------------------------------------------
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

output = munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
p output
