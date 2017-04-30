=begin
1. Display the initial empty 3x3 board
2. Ask the user to mark a square
3. Computer marks a square
4. Display the updated board state.
5. if winner, display winner.
6. if the board is full, display tie.
7. if neither winner nor board is full, go to #2
8. Play again?
9. if yes, go to #1
10. Good Bye!
=end

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # vertical
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # horizontal
                [[1, 5, 9], [3, 5, 7]]              # diagonal

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength
def dislay_board(brd, games)
  system 'clear' # clears the screen
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts "Games won: You = #{games["Player"]}. Computer = #{games["Computer"]}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delim = ', ', join_word = 'or')
  if arr.count == 0
    ''
  elsif arr.count == 1
    arr.first
  elsif arr.count == 2
    arr.join(" #{join_word} ")
  else
    arr[arr.count - 1] = "#{join_word} #{arr[arr.count - 1]}"
    arr.join(delim)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) # !! turn return into boolean. ie if nil -> FALSE
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # if brd[line[0]] == PLAYER_MARKER &&
    #    brd[line[1]] == PLAYER_MARKER &&
    #    brd[line[2]] == PLAYER_MARKER
    #   return 'Player'
    # elsif brd[line[0]] == COMPUTER_MARKER &&
    #       brd[line[1]] == COMPUTER_MARKER &&
    #       brd[line[2]] == COMPUTER_MARKER
    #   return 'Computer'
    # end
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

games_won = {"Player" => 0, "Computer" => 0}
loop do
  board = initialize_board

  loop do
    dislay_board(board, games_won)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  dislay_board(board, games_won)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    case detect_winner(board)
    when "Player" then games_won["Player"] += 1
    else games_won["Computer"] += 1
    end
  else
    prompt "Its's a tie!"
  end

  break if games_won["Computer"] == 2 || games_won["Player"] == 2
  
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing tic tac toe!"
