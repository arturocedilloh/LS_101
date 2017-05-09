SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
MAX_COUNT = 21
DEALER_MINUMUN = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == "A"
             11
           elsif value.to_i == 0 # J, Q, K
             10
           else
             value.to_i
           end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(total)
  total > MAX_COUNT
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_total, player_total)
  if player_total > MAX_COUNT
    :player_busted
  elsif dealer_total > MAX_COUNT
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def compute_result(result, score)
  case result
  when :player_busted
    score['Dealer'] += 1
  when :dealer_busted
    score['Player'] += 1
  when :player
    score['Player'] += 1
  when :dealer
    score['Dealer'] += 1
  end
end

def display_result(dealer_total, player_total, score)
  result = detect_result(dealer_total, player_total)
  compute_result(result, score)
  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
  prompt "Games won: You = #{score['Player']}. Dealer = #{score['Dealer']}"
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def display_score(dealer_cards, dealer_total, player_cards, player_total)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  puts "=============="
end

games_won = { "Player" => 0, "Dealer" => 0 }

prompt "Welcome to Twenty-One!"

loop do
  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  player_total = 0
  dealer_total = 0

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  player_total = total(player_cards)

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards}, for a total of #{player_total}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      player_total = total(player_cards)
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{player_total}"
    end

    break if player_turn == 's' || busted?(player_total)
  end

  if busted?(player_total)
    display_score(dealer_cards, dealer_total, player_cards, player_total)
    display_result(dealer_total, player_total, games_won)
    play_again? ? next : break
  else
    prompt "You stayed at #{player_total}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    dealer_total = total(dealer_cards)
    break if dealer_total >= DEALER_MINUMUN

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_total)
    display_score(dealer_cards, dealer_total, player_cards, player_total)
    prompt "Dealer total is now: #{dealer_total}"
    display_result(dealer_total, player_total, games_won)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stays - compare cards!
  display_score(dealer_cards, dealer_total, player_cards, player_total)
  display_result(dealer_total, player_total, games_won)

  if games_won["Dealer"] == 5
    prompt "Dealer is the Winner!!!"
    break
  elsif games_won["Player"] == 5
    prompt "You are the Winner!!!"
    break
  end
  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"
