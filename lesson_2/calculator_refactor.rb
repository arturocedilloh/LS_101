# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Sunbtracting'
  when '3'
    'Multiplying'
  when '4'
    'Diving'
  end
end

number1 = ''
number2 = ''

prompt('Welcome to Calculator! Enter your name:')

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?
    propmt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hello #{name}!")

loop do # main loop
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp().to_f

    if valid_number?(number1)
      break
    else
      prompt("Hmmm..... that doesn;t look like a valid number")
    end
  end
  # Kernel.puts(number1.chomp().inspect())

  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp().to_f
    if valid_number?(number2)
      break
    else
      prompt("Hmmm..... that doesn;t look like a valid number")
    end
  end

  operation_prompt = <<-decide
      What operation would you like to perform?
      1) add
      2) subtract
      3) multiply
      4) divide
  decide

  prompt(operation_prompt)
  operator = ""
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Error. Please select 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers....")
  answer = case operator
           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1 / number2
           end

  prompt("The result is #{answer}")

  prompt('Do you want to perform another calculation? (y to calculate again')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using Calculator. Good bye!")
