=begin
# Runaway Loop
loop do
  puts 'Just keep printing...'
  break
end

# Loopception
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end
  break
end

puts 'This is outside all loops.'

# Control the loop
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

# loop on command
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == "yes"
    puts 'Incorrect answer. Please answer "yes".'
end

#Sya hello

say_hello = true
count = 0

while say_hello
  puts 'Hello!'
  count += 1
  say_hello = false if count == 5
end

#Print while

numbers = []
index_number = 0
while  index_number < 5
  numbers[index_number] = rand(100)
  index_number += 1
end

puts numbers

numbers = []

while numbers.size < 5
  numbers << rand(100)
end

puts numbers

# Count Up
count = 1

until count > 10
  puts count
  count += 1
end


#Print Unitl
numbers = [7, 9, 13, 25, 18]

until numbers.size == 0
  puts numbers[0]
  numbers.shift
end


#That's Odd
for i in 1..100
  puts i if i % 2 != 0
end
=end

#Greet Your Friends
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for i in friends do
  puts "Hello, #{i}!"
end

friends.each {|friend| puts "Hello, #{friend}!"}
