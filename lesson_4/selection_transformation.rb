=begin
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(fruit_list)
 hsh = {}
  fruit_list.each do |k,v|
    if v == 'Fruit'
      hsh[k] = v
    end
  end

  hsh

end

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

puts produce
#----------------------------------------------------------------------

def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end


def double_numbers!(numbers)

  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end

  numbers
end


puts my_numbers = [1, 4, 3, 7, 2, 6]
puts double_numbers(my_numbers)
puts my_numbers

puts double_numbers!(my_numbers)
puts my_numbers
#-----------------------------------------------------------------------

def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

puts my_numbers = [1, 4, 3, 7, 2, 6]
puts double_odd_numbers(my_numbers)

puts my_numbers

#-----------------------------------------------------------------------

def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    # used to be current_value == 'Fruit'
    if current_value == selection_criteria
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
general_select(produce, 'Meat')


#-----------------------------------------------------------------------


def multiply(number_list, choice)
  counter = 0
  loop do
    break if counter == number_list.size

    number_list[counter] = number_list[counter] * choice
    counter += 1
  end
  number_list
end

puts my_numbers = [1, 4, 3, 7, 2, 6]
puts multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]

#-----------------------------------------------------------------------
=end

def select_letter(sentence, character)
  selected_chars = ''
  counter = 0

  loop do
    break if counter == sentence.size
    current_char = sentence[counter]

    if current_char == character
      selected_chars << current_char
    end

    counter += 1
  end

  selected_chars
end

question = 'How many times does a particular character appear in this sentence?'
select_letter(question, 'a') # => "aaaaaaaa"
select_letter(question, 't') # => "ttttt"
select_letter(question, 'z') # => ""
