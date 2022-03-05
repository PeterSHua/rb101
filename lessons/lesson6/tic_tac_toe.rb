=begin
Example 3 x 3 board with 1d coordinates
     |     |
  0  |  1  |  2
_____|_____|_____
     |     |
  3  |  4  |  5
_____|_____|_____
     |     |
  6  |  7  |  8
     |     |

top board row
  - blank row with vertical dividers
  - piece row with vertical dividers
  - blank row with vertical and horizontal dividers
middle board row(s)
  - blank row with vertical dividers
  - piece row with vertical dividers
  - blank row with vertical and horizontal dividers
bottom board row
  - blank row with vertical dividers
  - piece row with vertical dividers
  - blank row with vertical dividers
=end

require 'yaml'
require 'pry-byebug'

MESSAGES = YAML.load_file('tic_tac_toe.yml')
SCREEN_LENGTH = 80
WIN_CONDITION = 5
PIECES_CHOICE = %w(X O R)
PIECE_WIDTH = 1
SQUARE_WIDTH = 5
PAD_CHAR = ' '
GRID_VERT_CHAR = '|'
GRID_HORZ_CHAR = '_'

def request_grid_size
  prompt(MESSAGES['grid_size'])
  loop do
    input = gets.chomp
    return input.to_i if input == input.to_i.to_s && input.to_i > 1
    prompt(MESSAGES['invalid_choice'])
  end
end

def init_scores
  {
    human: 0,
    ai: 0
  }
end

def init_pieces
  {
    human: '',
    ai: ''
  }
end

def clean_screen
  system 'clear'
end

def init_board(grid_size)
  [' '] * (grid_size**2)
end

def clear_board!(board)
  board.map! { ' ' }
end

def calculate_front_pad(center_str)
  front_pad_length = (SQUARE_WIDTH - center_str.length) / 2
  PAD_CHAR * front_pad_length
end

def calculate_back_pad(front_pad, center_str)
  back_pad_length = SQUARE_WIDTH - front_pad.length - center_str.length
  PAD_CHAR * back_pad_length
end

def draw_blank_vert(grid_size)
  puts (PAD_CHAR * SQUARE_WIDTH + GRID_VERT_CHAR) * (grid_size - 1)
end

def draw_piece_vert(grid_size, board, row)
  front_pad = calculate_front_pad(PIECES_CHOICE[0])
  back_pad = calculate_back_pad(front_pad, PIECES_CHOICE[0])

  (grid_size - 1).times do |idx|
    print "#{front_pad}"\
          "#{board[row * grid_size + idx]}"\
          "#{back_pad}|"
  end

  puts "#{front_pad}"\
       "#{board[row * grid_size + (grid_size - 1)]}"\
       "#{back_pad}#{row}"
end

def draw_blank_horz_vert(grid_size)
  square = GRID_HORZ_CHAR * SQUARE_WIDTH + GRID_VERT_CHAR
  last_square = GRID_HORZ_CHAR * SQUARE_WIDTH
  puts "#{square * (grid_size - 1)}#{last_square}"
end

def draw_y_coords(grid_size)
  (grid_size).times do |idx|
    front_pad = calculate_front_pad(idx.to_s)
    back_pad = calculate_back_pad(front_pad, idx.to_s)
    print "#{front_pad}#{idx}#{back_pad} "
  end

  puts
end

def draw_top_row(grid_size, board)
  draw_blank_vert(grid_size)
  draw_piece_vert(grid_size, board, 0)
  draw_blank_horz_vert(grid_size)
end

def draw_middle_rows(grid_size, board)
  (1...(grid_size - 1)).each do |row|
    draw_blank_vert(grid_size)
    draw_piece_vert(grid_size, board, row)
    draw_blank_horz_vert(grid_size)
  end
end

def draw_bottom_row(grid_size, board)
  draw_blank_vert(grid_size)
  draw_piece_vert(grid_size, board, grid_size - 1)
  draw_blank_vert(grid_size)
  puts
end

def print_divider
  puts "-" * SCREEN_LENGTH
end

def print_scores(pieces, scores)
  prompt("(#{pieces[:human]}) #{MESSAGES['human_score']} "\
         "#{scores[:human]}")
  prompt("(#{pieces[:ai]}) #{MESSAGES['ai_score']} #{scores[:ai]}")
  print_divider
end

def draw_board(grid_size, board)
  clean_screen
  draw_y_coords(grid_size)
  draw_top_row(grid_size, board)
  draw_middle_rows(grid_size, board)
  draw_bottom_row(grid_size, board)
end

def prompt(msg)
  puts "=> #{msg}"
end

def request_human_piece
  human_piece = ''

  loop do
    prompt(MESSAGES["piece_choice"])
    human_piece = gets.chomp.upcase
    break if PIECES_CHOICE.include?(human_piece)
    prompt(MESSAGES["invalid_choice"])
  end

  if human_piece == PIECES_CHOICE[-1]
    human_piece = PIECES_CHOICE[0..-2].sample
  else
    human_piece
  end
end

def decide_ai_piece(human_piece)
  case human_piece
  when 'X' then 'O'
  when 'O' then 'X'
  end
end

def switch_pieces(pieces)
  pieces[:human], pieces[:ai] = pieces[:ai], pieces[:human]
end

def joinor(arr, delim = ', ', last = 'or')
  case arr.size
  when 0 then return ''
  when 1 then return arr.first.to_i
  when 2 then delim = ' '
  end

  arr[0..-2].each_with_object("") { |ele, str| str << ele.to_s + delim } +
    last + ' ' + arr[-1].to_s
end

# rubocop: disable Metrics/AbcSize
def get_human_move_coord(grid_size, board, row_or_column = 'r')
  # Get row or column number from user
  # Displays only those rows/columns where empty squares exist

  loop do
    if row_or_column == 'c'
      prompt(MESSAGES['human_column'])
    else
      prompt(MESSAGES['human_row'])
    end

    prompt(joinor(open_rows_or_columns(grid_size, board, row_or_column)))

    input = gets.chomp

    if input.to_i.to_s == input && (0...grid_size).include?(input.to_i)
      return input.to_i
    end

    prompt(MESSAGES['invalid_choice'])
  end
end
# rubocop: enable Metrics/AbcSize

def open_rows_or_columns(grid_size, board, choice = 'r')
  # Interate empty squares and converts to 2d coordinates

  open_square_coords = []

  board.each_with_index do |square, idx|
    open_square_coords << idx if square == ' '
  end

  rows = []
  columns = []

  open_square_coords.each do |open_square_coord|
    x, y = convert_to_2d(grid_size, open_square_coord)
    rows << y
    columns << x
  end

  return rows.uniq.sort if choice == 'r'
  return columns.uniq.sort if choice == 'c'
end

def convert_to_2d(grid_size, coord)
  y_coord = 0

  until y_coord * grid_size > coord
    y_coord += 1
  end

  y_coord -= 1
  x_coord = coord - y_coord * grid_size

  return x_coord, y_coord
end

def convert_to_1d(grid_size, row, column)
  row * grid_size + column
end

def human_move!(grid_size, board, human_piece)
  loop do
    coord_1d = get_human_move_coord(grid_size, board, 'c') +
               get_human_move_coord(grid_size, board, 'r') * grid_size

    if board[coord_1d] == ' '
      board[coord_1d] = human_piece
      return coord_1d
    end

    prompt(MESSAGES['square_occupied'])
  end
end

def empty_square_in_row(grid_size, board, row)
  (0...grid_size).each do |col|
    square = convert_to_1d(grid_size, row, col)
    return square if board[square] == ' '
  end
  nil
end

def empty_square_in_col(grid_size, board, col)
  (0...grid_size).each do |row|
    square = convert_to_1d(grid_size, row, col)
    return square if board[square] == ' '
  end
  nil
end

def empty_square_in_diag1(grid_size, board)
  (0...grid_size).each do |row_col|
    square = convert_to_1d(grid_size, row_col, row_col)
    return square if board[square] == ' '
  end
  nil
end

def empty_square_in_diag2(grid_size, board)
  (1..grid_size).each do |row_col|
    square = convert_to_1d(grid_size, row_col, -row_col)
    return square if board[square] == ' '
  end
  nil
end

def find_danger_square(grid_size, board, piece)
  # Check board for imminent win for human pieces in any row, column or diagonal

  danger_row = row_check(grid_size, board, piece, grid_size - 1)
  danger_col = column_check(grid_size, board, piece, grid_size - 1)
  danger_diag1 = diag1_filled?(grid_size, board, piece, grid_size - 1)
  danger_diag2 = diag2_filled?(grid_size, board, piece, grid_size - 1)

  if !!danger_row
    square = empty_square_in_row(grid_size, board, danger_row)
    return square if !!square
  end

  if !!danger_col
    square = empty_square_in_col(grid_size, board, danger_col)
    return square if !!square
  end

  if danger_diag1
    square = empty_square_in_diag1(grid_size, board)
    return square if !!square
  end

  if danger_diag2
    square = empty_square_in_diag2(grid_size, board)
    return square if !!square
  end

  nil
end

def ai_move!(grid_size, board, pieces)
  # Select square that results in imminent win for human
  # Randomly select an empty square if no imminent win for human

  prompt(MESSAGES['ai_turn'])

  danger_square = find_danger_square(grid_size, board, pieces[:human])

  if !!danger_square
    square = danger_square
  else
    empty_squares = []
    board.each_with_index do |obj, idx|
      empty_squares << idx if obj == ' '
    end
    square = empty_squares.sample
  end

  board[square] = pieces[:ai]
end

def row_check(grid_size, board, piece, piece_count)
  # Traverses each row and counts occurances of piece in each row
  # Returns the row if count reaches piece_count, otherwise nil

  # Traverse each row
  (0...grid_size).map do |row|
    # Traverse each square by column, within a row
    row_total = (0...grid_size).map do |column|
      board[convert_to_1d(grid_size, row, column)]
    end
    row_total.count(piece)
  end.index(piece_count)
end

def column_check(grid_size, board, piece, piece_count)
  # Traverses each column and counts occurances of piece in each column
  # Returns the column if count reaches piece_count, otherwise nil

  # Traverse each column
  (0...grid_size).map do |column|
    # Traverse each square by row, within a column
    (0...grid_size).map do |row|
      board[convert_to_1d(grid_size, row, column)]
    end.count(piece)
  end.index(piece_count)
end

def diag1_filled?(grid_size, board, piece, piece_count)
  # Traverse diagonal from top-left to bottom-right and counts occurances of
  # piece in diagonal
  # Returns true/false whether count of piece reached pice_count

  (0...grid_size).map do |row_column|
    board[convert_to_1d(grid_size, row_column, row_column)]
  end.count(piece) == piece_count
end

def diag2_filled?(grid_size, board, piece, piece_count)
  # Traverse diagonal from top-left to bottom-right and counts occurances of
  # piece in diagonal
  # Returns true/false whether count of piece reached pice_count

  (1..grid_size).map do |row_column|
    board[convert_to_1d(grid_size, row_column, -row_column)]
  end.count(piece) == piece_count
end

def win?(grid_size, board, piece)
  !!row_check(grid_size, board, piece, grid_size) ||
    !!column_check(grid_size, board, piece, grid_size) ||
    diag1_filled?(grid_size, board, piece, grid_size) ||
    diag2_filled?(grid_size, board, piece, grid_size)
end

def tie?(board)
  board.count(' ') == 0
end

def determine_match_result(grid_size, board, current_piece)
  if win?(grid_size, board, current_piece)
    'win'
  elsif tie?(board)
    'tie'
  else
    'continue'
  end
end

def print_match_result(current_player, result)
  case result
  when 'win'
    prompt(MESSAGES['ai_win_match']) if current_player == :ai
    prompt(MESSAGES['human_win_match']) if current_player == :human
  when 'tie'
    prompt(MESSAGES['tie'])
  end
end

def update_scores(scores, current_player)
  scores[current_player] += 1
end

def game_over?(scores)
  scores[:human] == WIN_CONDITION || scores[:ai] == WIN_CONDITION
end

def display_winner(scores)
  prompt(MESSAGES['human_win_game']) if scores[:human] == WIN_CONDITION
  prompt(MESSAGES['ai_win_game']) if scores[:ai] == WIN_CONDITION
end

def next_match
  user_input = ''
  until user_input =~ /./
    prompt(MESSAGES['next_match'])
    user_input = gets.chomp
  end
end

def play_again?
  user_input = ''
  until %w(y n).include?(user_input)
    prompt(MESSAGES['again'])
    user_input = gets.chomp.downcase
  end
  user_input == 'y'
end

# Main
clean_screen
prompt(MESSAGES['welcome'])

# Game loop
loop do
  grid_size = request_grid_size

  board = init_board(grid_size)
  scores = init_scores
  pieces = init_pieces

  pieces[:human] = request_human_piece
  pieces[:ai] = decide_ai_piece(pieces[:human])

  # Match loop
  loop do
    current_player = :ai
    match_result = ''
    flip_flop = true if pieces[:human] == 'O'

    clear_board!(board)
    draw_board(grid_size, board)
    print_scores(pieces, scores)

    loop do
      if flip_flop
        ai_move!(grid_size, board, pieces)
        current_player = :ai
      else
        human_move!(grid_size, board, pieces[:human])
        current_player = :human
      end

      current_piece = pieces[current_player]

      draw_board(grid_size, board)
      print_scores(pieces, scores)

      match_result = determine_match_result(grid_size, board, current_piece)

      if match_result != 'continue'
        update_scores(scores, current_player)
        break
      end

      flip_flop = !flip_flop
    end

    clean_screen
    draw_board(grid_size, board)
    print_scores(pieces, scores)
    print_match_result(current_player, match_result)
    break if game_over?(scores)
    switch_pieces(pieces)
    next_match
  end

  display_winner(scores)
  break if !play_again?
end
