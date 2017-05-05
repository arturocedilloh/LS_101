# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#  - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

player_cards = []
dealer_cards = []

# rubocop:disable Metrics/AbcSize
def display_board(player, dealer)
  system "clear" # clears the screen
  puts ""
  puts "  Dealers Cards  "
  puts "                 "
  puts "     #{dealer}"
  puts "-----------------------------------------"
  puts "  Player Cards  "
  puts "                 "
  puts "     #{player}"
  puts "-------------------------------------------"
end
# rubocop:enable Metrics/AbcSize

def deck_type(deck, card)
  deck << ['h', card]
  deck << ['d', card]
  deck << ['c', card]
  deck << ['s', card]
end

def initialize_deck(deck)
  (0..12).each do |i|
    case i
    when 0 then deck_type(deck, "A")
    when 10 then deck_type(deck, "J")
    when 11 then deck_type(deck, "Q")
    when 12 then deck_type(deck, "K")
    else
      value = (i + 1).to_s
      deck << ['H', value]
      deck << ['D', value]
      deck << ['C', value]
      deck << ['S', value]
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

def ace_card_count(cards, current_total)
  cards.count.times do
    if current_total < 11
      current_total += 11
    else
      current_total += 1
    end
  end
  current_total
end

def total_deck_count(cards)
  values = cards.map { |card| card[1] }
  ace_cards = values.select { |i| i == "A" }
  non_ace_cards = values.select { |i| i != "A" }

  non_ace_count = no_ace_card_count(non_ace_cards)
  total_count = ace_card_count(ace_cards, non_ace_count)
end


loop
  # initialize_deck(deck_cards)
  dealer_cards.push(deck_cards.pop)
  player_cards.push(deck_cards.pop)
  player_cards.push(deck_cards.pop)
  display_board(player_cards,dealer_cards)
  player_deck_count = 0
  dealer_deck_count = 0
  answer = nil
  loop do
    puts "hit or stay?"
    answer = gets.chomp
    break if answer == 'stay' || busted?
    player_cards.push(deck_cards.pop)
    player_deck_count = total_deck_count(player_cards)
    display_board(player_cards,dealer_cards)
  end

  if busted?
    # end game or ask user to play again
  else
    puts "You chose to stay!"
  end

  while dealer_deck_count < player_deck_count
    dealer_cards.push(deck_cards.pop)
    dealer_deck_count = total_deck_count(dealer_cards)
    display_board(player_cards,dealer_cards)
    break if dealer_deck_count > 17 || busted?

    if busted?
      # end game or ask user to play again
    end
  end
end

p deck_cards

p total_count
