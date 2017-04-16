VALID_CHOICES = ['rock', 'paper', 'scissors']
def prompt(message)
  Kernel.puts("=> message")
end

prompt("Choose one: #{{VALID_CHOICES.join(',')}")
choice = Kernel.gets().chomp()

computer_choice = VALID_CHOICES.sample
