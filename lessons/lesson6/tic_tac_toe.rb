=begin
     |     |
  0  |  1  |  2
_____|_____|_____
     |     |
  3  |  4  |  5
_____|_____|_____
     |     |
  6  |  7  |  8
     |     |

3 x 3 board
top board row
  - blank row with vertical dividers
  - piece row with vertical dividers
  - blank row with vertical and horizontal dividers
middle board row
  - blank row with vertical dividers
  - piece row with vertical dividers
  - blank row with vertical and horizontal dividers
bottom board row
  - blank row with vertical dividers
  - piece row with vertical dividers
  - blank row with vertical dividers

pieces (X or O) use X, Y coordinates
2d coordinates to 1d conversion: coord_1d = x + 3 * y
=end

require 'yaml'
require 'pry-byebug'

MESSAGES = YAML.load_file('tic_tac_toe.yml')
GRID_SIZE = 4
SQUARE_CHOICE = %w(ul uc ur ml mc mr bl bc br)
PIECES_CHOICE = %w(X O R)

@board = [' '] * (GRID_SIZE**2)
@player_piece = ''
@computer_piece = ''

def clear_board
  @board.map! { ' ' }
end

def draw_blank_vert
  # draw blank row with vertical dividers
  puts "     |" * (GRID_SIZE - 1) + "     "
end

def draw_piece_vert(row)
  # draw piece row with vertical dividers
  (GRID_SIZE - 1).times do |idx|
    print "  #{@board[row * GRID_SIZE + idx]}  |"
  end
  puts "  #{@board[row * GRID_SIZE + (GRID_SIZE - 1)]}"
end

def draw_blank_horz_vert
  # draw blank row with horizontal and vertical dividers
  puts "_____|" * (GRID_SIZE - 1) + "_____"
end

def draw_top_row
  draw_blank_vert
  draw_piece_vert(0)
  draw_blank_horz_vert
end

def draw_middle_rows
  (1...(GRID_SIZE - 1)).each do |row|
    draw_blank_vert
    draw_piece_vert(row)
    draw_blank_horz_vert
  end
end

def draw_bottom_row
  draw_blank_vert
  draw_piece_vert(GRID_SIZE - 1)
  draw_blank_vert
  puts
end

def draw_board
  system 'clear'
  draw_top_row
  draw_middle_rows
  draw_bottom_row
end

def prompt(msg)
  puts "=> #{msg}"
end

def decide_pieces
  loop do
    prompt(MESSAGES["piece_choice"])
    @player_piece = gets.chomp.upcase
    break if PIECES_CHOICE.include?(@player_piece)
    prompt(MESSAGES["invalid_choice"])
  end

  case @player_piece
  when 'X' then @computer_piece = 'O'
  when 'O' then @computer_piece = 'X'
  else
    pieces = PIECES_CHOICE[0..-2]
    @player_piece = pieces.sample
    @computer_piece = pieces[pieces.index(@player_piece) - 1]
  end
end

def req_player_move
  prompt(MESSAGES['player_choice1'])
  prompt(MESSAGES['player_choice2'])
  prompt(MESSAGES['player_choice3'])

  gets.chomp.downcase
end

def player_move
  # ask user for move
  # convert user input into coordinate
  # update board with piece

  choice = ''

  loop do
    choice = req_player_move
    player_move_coord = 0

    if SQUARE_CHOICE.include?(choice)
      player_move_coord = SQUARE_CHOICE.index(choice)

      if @board[player_move_coord] == ' '
        @board[player_move_coord] = @player_piece
        return player_move_coord
      end

      prompt(MESSAGES['square_occupied'])
      next
    end
    prompt(MESSAGES['invalid_choice'])
  end
end

def computer_move
  # updates board with computer's move
  # check board for empty squares
  # randomly select a square
  empty_squares = []
  @board.each_with_index do |obj, idx|
    empty_squares << idx if obj == ' '
  end
  move = empty_squares.sample
  @board[move] = @computer_piece
end

def row_check(piece)
  (0...GRID_SIZE).map do |row|
    (0...GRID_SIZE).map do |column_within_row|
      @board[row * GRID_SIZE + column_within_row]
    end.count(piece)
  end.include?(3)
end

def column_check(piece)
  (0...GRID_SIZE).map do |column|
    (0...GRID_SIZE).map do |row_within_column|
      @board[row_within_column * GRID_SIZE + column]
    end.count(piece)
  end.include?(3)
end

def diag1_check(piece)
  (0...GRID_SIZE).map do |diag_square|
    @board[diag_square * GRID_SIZE + diag_square]
  end.count(piece) == 3
end

def diag2_check(piece)
  (1..GRID_SIZE).map do |diag_square|
    @board[diag_square * GRID_SIZE - diag_square]
  end.count(piece) == 3
end

def check_win(piece)
  # input: string either 'X' or 'O'
  # output: boolean whether the input piece won

  # check left coordinates until limit
  # check right coordinates until limit
  # check up coordinates until limit
  # check down coordinates until limit
  # check upleft coordinates until limit
  # check upright coordinates until limit
  # check downleft coordinates until limit
  # check downright coordinates until limit

  # right limit (coord_1d + 1) % 3 == 0
  # left limit coord_1d % 3 == 0
  # up limit coord_1d >= 0
  # down limit coord_1d < length ** length

  # +1 coordinates are right
  # -1 coordinates are left
  # +2 coordinates are downleft
  # -2 coordinates are upright
  # +3 coordinates are down
  # -3 coordinates are up
  # +4 coordinates downright
  # -4 coordinates upleft

  row_check(piece) || column_check(piece) || diag1_check(piece) || diag2_check(piece)
end

def tie?
  # input: none
  # output: boolean whether board is filled
  @board.count(' ') == 0
end

prompt(MESSAGES['welcome'])

loop do
  clear_board
  draw_board
  decide_pieces

  loop do
    if @player_piece == 'X'
      player_move
      draw_board

      if check_win(@player_piece)
        prompt(MESSAGES['player_win'])
        break
      end

      if tie?
        prompt(MESSAGES['tie'])
        break
      end

      prompt(MESSAGES['computer_turn'])
      sleep 1

      computer_move
      draw_board

      if check_win(@computer_piece)
        prompt(MESSAGES['computer_win'])
        break
      end

      if tie?
        prompt(MESSAGES['tie'])
        break
      end

    else
      prompt(MESSAGES['computer_turn'])
      sleep 1

      computer_move
      draw_board

      if check_win(@computer_piece)
        prompt(MESSAGES['computer_win'])
        break
      end

      if tie?
        prompt(MESSAGES['tie'])
        break
      end

      player_move
      draw_board

      if check_win(@player_piece)
        prompt(MESSAGES['player_win'])
        break
      end

      if tie?
        prompt(MESSAGES['tie'])
        break
      end
    end
  end

  prompt(MESSAGES['again'])
  break if gets.chomp.downcase == 'n'
end
