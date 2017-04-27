statement = "The Flintstones Rock"
out = statement.split("").each_with_object({}) do |i,hsh|
  if hsh.key?(i)
    hsh[i] = hsh[i] + 1
  else
    hsh[i] = 1
  end
end
p out
