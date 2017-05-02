
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3]]              # diagonal
require 'pry'
bord = ['X', 'X',' ']



def computer_places_piece!(brd)
  square = ''
  WINNING_LINES .each do |line|
    if brd.values_at(0, 1, 2).count(PLAYER_MARKER) == 2
      brd.each_with_index do |item, i|
        if item == INITIAL_MARKER
          square = i
        end
      end
        brd[square] = COMPUTER_MARKER
    end
  end

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
