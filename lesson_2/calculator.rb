# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)
Kernel.puts('Welcome to Calculator!')
Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp().to_i

#Kernel.puts(number1.chomp().inspect())

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp().to_i

Kernel.puts('What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide')
operator = Kernel.gets().chomp()

answer = if operator == '1'
            number1 + number2
          elsif operator == '2'
            number1 - number2
          elsif operator == '3'
            number1 * number2
          elsif operator == '4'
            number1.to_f / number2.to_f
          else
            'not a valid operator!!!!'
          end

Kernel.puts("The result is: #{answer}")
