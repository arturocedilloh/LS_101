def joinor(arr, delim = ', ', join_word = 'or')
  if arr.count == 2
    arr.join(' or ')
  else
    arr[arr.count - 1] = "#{join_word} #{arr[arr.count - 1]}"
    arr.join(delim)
  end
end

arr1 = [1, 2, 3]

p joinor(arr1, '; ')
