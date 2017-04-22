#begin
#end
#Exercise 1--------------------------------------
result = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

print result
