#require 'pry'
#binding.pry
=begin
#Exercise 1------------------------
arr = ['10', '11', '9', '7', '8']
arr.sort_by! do |i|
    i.to_i
end

new_array=[]
arr.reverse_each do |element|
  new_array <<  element
end
p new_array

#other solution
arr.sort do |a,b|
  b.to_i <=> a.to_i
end

#Exercise 2------------------------

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_array = books.sort_by do |element|
  element[:published]
end

p sorted_array


#Exercise 3------------------------
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
out = arr1.flatten.each do |i|
  p i if i == 'g'
end

p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third][0]


arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].key(0)

#Exercise 5------------------------

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

output = munsters.select do |k,v|
  male_hsh = v["gender"] == "male"
end

output2 = output.map do |_,v|
  v["age"]
end

age_sum = 0
output2.each do |i|
  age_sum += i
end

p age_sum

total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

p total_male_age

munsters.each_pair do |name,details|
  p "#{name} is a #{details["age"]}-year-old #{details["gender"]}"
end


#Exercise 7------------------------
vowels = 'aeiou'
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
new_array=[]
hsh.each do |k,v|
  v.each do |i|
    i.chars.each do |v|
    puts v if vowels.include?(v)
    end
  end
end

#Exercise 9-----------------------
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_array = arr.map do |element|
    element.sort do |a, b|
      b <=> a
    end
end
p new_array

#Exercise 10-----------------------
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
new_array = arr.each do |a|
  a.map do |k,v|
    a[k] += 1
  end
end
p new_array


#Exercise 11-----------------------
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

output = arr.map do |element|
  element.select do |num|
    num % 3 == 0
  end
end
p output

#Exercise 12-----------------------
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end
p hsh


#Exercise 13-----------------------
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
out = arr.sort_by do |arr|
 out2 =  arr.select do |num|
    num.odd?
  end
  p out2
end

p out

#Exercise 14-----------------------
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end

=end
#Exercise 15-----------------------
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
out = arr.select do |item|
  item.all? do |k,v|
    v.all? do |value|
      value.even?
    end
  end
end

p out
