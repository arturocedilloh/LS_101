# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#  - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

require'pry'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(player, dealer, player_count, dealer_count, type)
  system "clear" # clears the screen
  puts ""
  puts "  Dealers has: #{show_cards(dealer, "Dealer", type)}"
  puts "  You have:    #{show_cards(player, "You", type)}"
  puts "-------------------------------------------"
  puts " Current Dealer Count #{dealer_count}, Your count: #{player_count}"
end
# rubocop:enable Metrics/AbcSize

def deck_build!(deck, card)
  deck << ['H', card]
  deck << ['D', card]
  deck << ['C', card]
  deck << ['S', card]
end

def initialize_deck(deck)
  (0..12).each do |i|
    case i
    when 0 then deck_build!(deck, "A")
    when 10 then deck_build!(deck, "J")
    when 11 then deck_build!(deck, "Q")
    when 12 then deck_build!(deck, "K")
    else
      value = (i + 1).to_s
      deck_build!(deck, value)
    end
  end

  deck.shuffle!
end

def no_ace_card_count(cards)
  total = 0
  cards.each do |card|
    if %(K Q J).include? card
      total += 10
    else
      total += card.to_i
    end
  end
  total
end

def total_deck_count(cards)
  values = cards.map { |card| card[1] }
  ace_cards = values.select { |i| i == "A" }
  non_ace_cards = values.select { |i| i != "A" }
  total_count = no_ace_card_count(non_ace_cards)

  ace_cards.count.times do
    if total_count < 11
      total_count += 11
    else
      total_count += 1
    end
  end
  total_count
end

def busted?(count)
  count > 21
end

def show_cards(cards, player, type)
  output = ""
  values = cards.map { |card| card[1]}
  values.each do |value|
    if output == ""
      output = value
    else
      output = output + " and #{value}"
    end
  end

  output = output + " and unknown card" if player == "Dealer" && type == "display"
  output
end

loop do
  player_cards = []
  dealer_cards = []
  deck_cards = []
  initialize_deck(deck_cards)
  dealer_cards.push(deck_cards.pop)
  player_cards.push(deck_cards.pop)
  player_cards.push(deck_cards.pop)
  player_deck_count = total_deck_count(player_cards)
  dealer_deck_count = total_deck_count(dealer_cards)

  display_board(player_cards, dealer_cards, player_deck_count, dealer_deck_count, "display")

  loop do
    prompt("hit or stay?")
    answer = gets.chomp
    if answer == "hit"
      player_cards.push(deck_cards.pop)
      player_deck_count = total_deck_count(player_cards)
      display_board(player_cards, dealer_cards, player_deck_count, dealer_deck_count, "display")
      break if busted?(player_deck_count)
    else
      break
    end
  end

  if busted?(player_deck_count)
    display_board(player_cards, dealer_cards, player_deck_count, dealer_deck_count, "final")
    puts "You busted!!! - Dealer WINS!!!"
    puts "Your cards totalled to #{player_deck_count}"
  else
    prompt("You chose to stay!")
    while dealer_deck_count < player_deck_count
      dealer_cards.push(deck_cards.pop)
      dealer_deck_count = total_deck_count(dealer_cards)
      display_board(player_cards, dealer_cards, player_deck_count, dealer_deck_count, "display")
      break if (dealer_deck_count > 17 && (dealer_deck_count < player_deck_count)) || busted?(dealer_deck_count)
    end

    if busted?(dealer_deck_count)
      display_board(player_cards, dealer_cards, player_deck_count, dealer_deck_count, "final")
      puts " Dealer busted!!! - You WIN!!!"
      puts " Dealer cards totalled to #{dealer_deck_count}}"
    else
      display_board(player_cards, dealer_cards, player_deck_count, dealer_deck_count, "final")
      if dealer_deck_count = player_deck_count
        puts " It's a TIE!!!"
      else
        puts " Dealer WINS!!!"
        puts " Dealer cards totalled to #{dealer_deck_count}}"
      end
    end
  end
  answer = ""
  loop do
    prompt(" Play again? (y or n)")
    answer = gets.chomp.downcase
    break if %w[y n].include? answer
    prompt(" Incorrect value. Please enter y or n.")
  end
  break unless answer.downcase == "y"
end
