
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3]]              # diagonal
require 'pry'
bord = ['X', 'X',' ']



def computer_places_piece!(brd)

end

p bord
p computer_places_piece!(bord)
p bord



=begin
def test (brd)
  move = 0
brd.each_with_index do |item, index|
  if item == INITIAL_MARKER
    move = index
  else
    item
  end
end
brd[move] = COMPUTER_MARKER

end

p bord
p test(bord)
p bord
=end
