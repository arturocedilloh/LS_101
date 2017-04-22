temp = {1 => 'bob',2 => 'jack'}.select do |num, v|
   num
end
p temp

temp = [1 => 'bob',2 => 'jack'].select do |num, v|
   num
end
p temp
