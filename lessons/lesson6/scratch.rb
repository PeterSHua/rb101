require 'yaml'
MESSAGES = YAML.load_file('tic_tac_toe.yml')
GRID_SIZE = 3
PIECES_CHOICE = %w(X O R)

@board = [' ', ' ', ' ',
          ' ', ' ', ' ',
          ' ', ' ', ' ']
@player_piece = ''
@computer_piece = ''

def init()
  prompt(MESSAGES['welcome'])
end

def draw_blank_vert
# draw blank row with vertical dividers
  puts "     |     |     "
end

def draw_piece_vert(row)
# draw piece row with vertical dividers
  puts "  #{@board[row * GRID_SIZE]}  |  #{@board[row * GRID_SIZE + 1]}  |"\
       "  #{@board[row * GRID_SIZE + 2]}  "
end

def draw_blank_horz_vert
  # draw blank row with horizontal and vertical dividers
    puts "_____|_____|_____"
  end

  def draw_top_row
    draw_blank_vert()
    draw_piece_vert(0)
    draw_blank_horz_vert()
  end

  def draw_middle_row
    draw_blank_vert()
    draw_piece_vert(1)
    draw_blank_horz_vert()
  end

  def draw_bottom_row
    draw_blank_vert()
    draw_piece_vert(2)
    draw_blank_vert()
  end

  def draw_board
    draw_top_row()
    draw_middle_row()
    draw_bottom_row()
  end

  def prompt(msg)
    puts "=> #{msg}"
  end

  def decide_pieces
    prompt(MESSAGE["piece_choice"])

    loop do
      @player_piece = gets.chomp.uppercase
      if PIECES_CHOICE.include?(@player_piece)
        break
      end
      prompt(MESSAGE["invalid_choice"])
    end

    case @player_piece
    when 'X'
      @computer_piece = 'O'
    when 'O'
      @computer_piece = 'X'
    else
      pieces = PIECES_CHOICE(0..-2)
      @player_piece = pieces.sample
      @computer_piece = pieces[pieces.index(@player_piece) - 1]
    end
  end

  def human_move(piece = 'X')
    # input: integer coordinate from human, X or O
    # output: string of 'X' or 'O'
    # updates board with human's move

    # ask user for move
    # convert user input into 1d coordinate
    # update board with piece
      prompt(MESSAGES['player_turn'])
      prompt(MESSAGES['player_choice1'])
      prompt(MESSAGES['player_choice2'])
      prompt(MESSAGES['player_choice3'])

      choice = ''

      loop do
        choice = gets.chomp.downcase
        if %w(ul uc ur ml mc mr bl bc br).include?(choice)
          break
        end
        prompt(MESSAGES['invalid_choice'])
        prompt(MESSAGES['player_choice1'])
        prompt(MESSAGES['player_choice2'])
        prompt(MESSAGES['player_choice3'])
      end

      idx = case choice
            when 'ul' then 0
            when 'uc' then 1
            when 'ur' then 2
            when 'ml' then 3
            when 'mc' then 4
            when 'mr' then 5
            when 'bl' then 6
            when 'bc' then 7
            when 'br' then 8
            end

      @board[idx] = piece
    end

    def computer_move(piece = 'O')
    # input: none
    # output: string of 'X' or 'O'
    # updates board with computer's move

    # check board for empty squares
    # randomly select a square
      empty_squares = []
      board.each_with_index do |obj, idx|
        if obj == ' '
          empty_squares << idx
        end
        @board[empty_squares.sample] = @computer_piece
      end
    end
