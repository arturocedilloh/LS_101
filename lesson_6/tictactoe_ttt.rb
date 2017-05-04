INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # vertical
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # horizontal
                [[1, 5, 9], [3, 5, 7]]              # diagonal
WHO_GOES_FIRST = "CHOOSE"

current_player = WHO_GOES_FIRST

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, games)
  system "clear" # clears the screen
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts "Games won: You = #{games['Player']}. Computer = #{games['Computer']}"
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
# rubocop:enable Metrics/AbcSize

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

def best_square(brd, move_type)
  square = nil
  if move_type == "offensive"
    WINNING_LINES.each do |line|
      square = find_at_offensive_square(line, brd)
      break if square
    end
    square
  elsif move_type == "risk"
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd)
      break if square
    end
    square
  end
end

def computer_places_piece!(brd)
  square = best_square(brd, "offensive")

  if !square
    square = best_square(brd, "risk")
  end

  square = 5 if !square && brd[5] == INITIAL_MARKER

  square = empty_squares(brd).sample if !square

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
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def find_at_risk_square(line, brd)
  if brd.values_at(*line).count(PLAYER_MARKER) == 2
    brd.select { |pos, v| line.include?(pos) && v == INITIAL_MARKER }.keys.first
  end
end

def find_at_offensive_square(line, brd)
  if brd.values_at(*line).count(COMPUTER_MARKER) == 2
    brd.select { |pos, v| line.include?(pos) && v == INITIAL_MARKER }.keys.first
  end
end

def place_piece!(brd, current_player, games_won)
  display_board(brd, games_won)
  case current_player
  when "PLAYER" then player_places_piece!(brd)
  when "COMPUTER" then computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  case current_player
  when "PLAYER" then "COMPUTER"
  when "COMPUTER" then "PLAYER"
  end
end

games_won = { "Player" => 0, "Computer" => 0 }

if WHO_GOES_FIRST == "CHOOSE"
  loop do
    prompt "Who should go first: Player or Computer?"
    current_player = gets.chomp.upcase

    break if %w[PLAYER COMPUTER].include? current_player
    prompt("Incorrect value. Please enter Player or Computer.")
  end
end

loop do
  board = initialize_board
  display_board(board, games_won)

  loop do
    display_board(board, games_won)

    place_piece!(board, current_player, games_won)
    current_player = alternate_player(current_player)

    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    if detect_winner(board) == "Player"
      games_won["Player"] += 1
    else
      games_won["Computer"] += 1
    end

    display_board(board, games_won)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "Its's a tie!"
  end

  break if games_won["Computer"] == 5 || games_won["Player"] == 5
  answer = ""

  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase
    break if %w[y n].include? answer
    prompt("Incorrect value. Please enter y or n.")
  end
  current_player = WHO_GOES_FIRST
  break unless answer.downcase == "y"
end

prompt "Thanks for playing tic tac toe!"
