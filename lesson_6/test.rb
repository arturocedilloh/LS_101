
=begin
def card_count(cards)
  total = 0
  cards.each do |card|
    if %[king queen jack].include? card
      total += 10
    else
      total += card.to_i
    end
  end
  total
end

cards = [["s", "king"], ["h", "ace"]]
values = cards.map {|card| card[1]}
ace_cards = values.select {|i| i == "ace"}
non_ace_cards = values.select {|i| i != "ace"}

p non_ace_cards

total_count = card_count(non_ace_cards)
if ace_cards != []
  ace_cards.count.times do
    if total_count < 11
      total_count += 11
    else
      total_count += 1
    end
  end
end


p total_count

=end
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

display_board([["S", "9"], ["H", "A"]], [["H", "1"], ["H", "7"], ["H", "A"]])
