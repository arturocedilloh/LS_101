VALID_CHOICES = { "r" => "rock(r)",
                  "p" => "paper(p)",
                  "sc" => "scissors(sc)",
                  "sp" => "spock(sp)",
                  "l" => "lizard(l)" }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock(r)' && (second == 'scissors(sc)' || second == 'lizard(l)')) ||
  (first == 'paper(p)' && (second == 'rock(r)' || second == 'spock')) ||
  (first == 'scissors(sc)' && (second == 'paper(p)' || second == 'lizard(l)')) ||
  (first == 'spock(sp)' && (second == 'scissors(sc)' || second == 'rock(r)')) ||
  (first == 'lizard(l)' && (second == 'spock(sp)' || second == 'paper(p)'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def display_score(player, computer, score_count)
  if win?(player, computer)
    score_count['you'] = score_count['you'] + 1
  elsif win?(computer, player)
    score_count['computer'] = score_count['computer'] + 1
  end
  prompt("You: #{score_count['you']} - Computer: #{score_count['computer']}")
end

running_score = { 'you' => 0, 'computer' => 0 }

loop do
  your_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.values.join(', ')}")
    your_choice = Kernel.gets().chomp().downcase()

    if VALID_CHOICES.key?(your_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.keys.sample
  your_choice_val = VALID_CHOICES[your_choice]
  comp_choice_val = VALID_CHOICES[computer_choice]
  prompt("You chose: #{your_choice_val}; Computer chose: #{comp_choice_val}")

  display_results(your_choice_val, comp_choice_val)

  prompt("The running score is:")
  display_score(your_choice_val, comp_choice_val, running_score)

  if running_score['you'] == 5
    prompt("You are the winner!!!!")
    break
  elsif running_score['computer'] == 5
    prompt("The computer is the winner!!!!")
    break
  end

  answer = ''
  loop do # check if Y or N is entered
    prompt('Do you want to play again?. Type Y to continue or N to end.')
    answer = Kernel.gets().chomp()
    break if %w(y n).include? answer.downcase()
    prompt('Incorrect value. Please enter Y to continue or N to end.')
  end
  break unless answer.downcase() == 'y' # exit if N is answered
end

prompt("Thanks you for playing. Good bye!")
