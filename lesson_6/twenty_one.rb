def prompt(msg)
  puts "=> #{msg}"
end

def display_board(player, dealer, type)
  puts "==================================================="
  puts "Dealers has: #{show_cards(dealer, 'Dealer', type)}"
  puts "You have:    #{show_cards(player, 'You', type)}"
  puts "---------------------------------------------------"
end

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
    if %(K Q J).include?(card)
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
  cards.each do |value|
    card = value[0] + ":" + value[1]
    if output == ""
      output = card
    else
      output += " and " + card
    end
  end
  output += " and ?" if player == "Dealer" && type == "display"
  output
end

prompt(" Welcome to Twenty One!")
loop do
  player_cards = []
  dealer_cards = []
  deck_cards = []
  initialize_deck(deck_cards)
  dealer_cards.push(deck_cards.pop)
  player_cards.push(deck_cards.pop)
  player_cards.push(deck_cards.pop)
  player_count = total_deck_count(player_cards)
  dealer_count = total_deck_count(dealer_cards)

  display_board(player_cards, dealer_cards, "display")
  puts "Dealer Count #{dealer_count}, Your count: #{player_count}"

  loop do
    player_answer = ""
    loop do
      prompt("(h)it or (s)tay?")
      player_answer = gets.chomp.downcase
      break if %w[h s].include? player_answer
      prompt("Incorrect value. Please enter (h)it or (s)tay")
    end

    if player_answer == "h"
      prompt("You chose to hit!")
      player_cards.push(deck_cards.pop)
      player_count = total_deck_count(player_cards)
      display_board(player_cards, dealer_cards, "display")
      puts "Dealer Count #{dealer_count}, Your count: #{player_count}"
      break if busted?(player_count)
    else
      break
    end
  end

  if busted?(player_count)
    display_board(player_cards, dealer_cards, "final")
    puts "Dealer Count #{dealer_count}, Your Count: #{player_count}"
    puts "You busted!!! - Dealer WINS!!!"
  else
    prompt(" You chose to stay!")
    loop do
      prompt(" Dealer hit!")
      dealer_cards.push(deck_cards.pop)
      display_board(player_cards, dealer_cards, "final")
      dealer_count = total_deck_count(dealer_cards)
      if dealer_count == player_count && dealer_count >= 17
        puts "It's a TIE!!!"
        puts "Dealer Count: #{dealer_count}, Your Count: #{player_count}"
        break
      elsif busted?(dealer_count)
        puts "Dealer busted!!! - You WIN!!!"
        puts "Dealer Count: #{dealer_count}, Your Count: #{player_count}"
        break
      elsif dealer_count >= 17 && (dealer_count > player_count)
        puts "Dealer WINS!!!"
        puts "Dealer Count: #{dealer_count}, Your Count: #{player_count}"
        break
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

prompt(" Thanks you for playing Twenty One. See you next time!")
