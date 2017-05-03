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
deck_cards =[]

def deck_type(deck, card)
  deck << ['h',card]
  deck << ['d',card]
  deck << ['c',card]
  deck << ['s',card]
end

def initialize_deck (deck)
  (0..12).each do |i|
    case i
    when 0 then deck_type(deck, "ace")
    when 10 then deck_type(deck, "jack")
    when 11 then deck_type(deck, "queen")
    when 12 then deck_type(deck, "king")
    else
      deck << ['h',"#{i + 1}"]
      deck << ['d',"#{i + 1}"]
      deck << ['c',"#{i + 1}"]
      deck << ['s',"#{i + 1}"]
    end
  end

  deck.shuffle!
end

initialize_deck(deck_cards)
p deck_cards
