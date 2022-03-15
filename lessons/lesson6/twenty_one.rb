# Twenty-One is a stripped down version of Blackjack.

require 'yaml'

MSGS = YAML.load_file('twenty_one.yml')
SUITS = %i(heart diamond club spade)
FACELESS = (2..10).to_a
FACES = %i(jack queen king)
FACE_VALUE = 10
TWO_FACED = %i(ace)
TWO_FACED_MAX = 11
TWO_FACED_MIN = 1
BLACKJACK = 21
HOUSE_RULE = 17
DEAL_TIMES = 4
HOLE = 2
NEXT_HOLE = 1
SCORE_LIMIT = 5
PLAYER_DIVIDER = '-'
TABLE_DIVIDER = '='
SCREEN_LENGTH = 80

def display_rules
  puts MSGS['rules']
end

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear'
end

# Enforces the user to enter an input that matches a regex in a given regex
# array. Returns the regex that matched.
def req_fm_rgx_list(msg, rgx_arr)
  prompt(msg)

  loop do
    user_input = gets.chomp

    return if rgx_arr.empty?

    rgx_arr.each do |rgx|
      return rgx if user_input =~ rgx
    end

    prompt(MSGS['invalid_choice'])
  end
end

# Returns true when the input from the user matches true_rgx.
# Returns false when the input from the user matches false_rgx.
def bool_fm_rgx_match_in_list(msg, true_rgx, false_rgx)
  rgx = req_fm_rgx_list(msg, [true_rgx, false_rgx])

  if rgx == true_rgx
    true
  elsif rgx == false_rgx
    false
  end
end

def wait_user
  msg = MSGS['wait_user']
  req_fm_rgx_list(msg, [])
end

# Returns a deck with the following structure:
# {
#   heart: [2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace]
#   diamond: [...]
#   club: [...]
#   spade: [...]
# }
def init_deck
  SUITS.each_with_object(Hash.new) do |suit_name, deck|
    deck[suit_name] = FACELESS + FACES + TWO_FACED
  end
end

def init_player(is_dealer)
  {
    cards: [],
    is_dealer: is_dealer,
    ace_count: 0,
    non_ace_sum: 0,
    aces_sum: 0,
    total_sum: 0,
    score: 0
  }
end

def init_card(suit, head)
  {
    suit: suit,
    head: head
  }
end

def calc_player_idx(players, idx)
  idx % players.count
end

# Returns an array of the player's cards as strings.
def convert_cards_sym_to_str(player)
  player[:cards].map do |card|
    if !FACELESS.include?(card[:head])
      "#{MSGS[card[:head].to_s]}#{MSGS[card[:suit].to_s]}"
    else
      "#{card[:head]}#{MSGS[card[:suit].to_s]}"
    end
  end
end

# Returns a string of the player name.
def player_name(player)
  if player[:is_dealer]
    MSGS['dealer']
  else
    MSGS['gambler']
  end
end

def display_score(player)
  puts "#{player_name(player)} (#{MSGS['score']}: #{player[:score]})"
end

# Returns a formatted string from array items seperated by a deliminator
# and ending with a grammar conjugation.
# The formatted string has no deliminator if the array has only 2 items.
# For example:
#   joinor([1, 2, 3, 4])
#     => 1, 2, 3, or 4
#   joinor([1, 2])
#     => 1 or 2
def joinor(arr, delim = ', ', last = 'or')
  case arr.size
  when 0 then return ''
  when 1 then return arr.first.to_s
  when 2 then delim = ' '
  end

  "#{arr[0..-2].join(delim)}#{delim}#{last} #{arr.last}"
end

# The dealer's hand's value is hidden until it's their turn.
def display_hand_total(player, mask = false)
  cards = convert_cards_sym_to_str(player)

  if player[:is_dealer] && hole?(player) && mask
    cards[HOLE - 1] = MSGS['hidden']
    total_sum = MSGS['hidden']
  else
    total_sum = player[:total_sum]
  end

  printable_cards = cards.empty? ? MSGS['empty'] : joinor(cards, ', ', 'and')

  puts "#{MSGS['hand']}: #{printable_cards}"
  puts "#{MSGS['total']} #{total_sum}"
end

def display_player_divider
  puts PLAYER_DIVIDER * SCREEN_LENGTH
end

def display_hands(players, mask)
  players.each do |player|
    display_score(player)
    display_hand_total(player, mask)
    display_player_divider if player != players.last
  end
end

def display_table_divider
  puts TABLE_DIVIDER * SCREEN_LENGTH
end

# rubocop: disable Layout/LineLength
# Example table:
# Gambler (0 wins)
# Hand: Ace, Ace, Ace, Ace, 2, 2, 2, 2, 3, 3, 3
# Total: 21
# --------------------------------------------------------------------------------
# Dealer (0 Wins)
# Hand: Ace, Ace, Ace, Ace, 2, 2, 2, 2, 3, 3, 3
# Total: 21
# ================================================================================
# rubocop: enable Layout/LineLength
def display_table(players, mask = false)
  display_hands(players, mask)
  display_table_divider
end

def rand_suit(deck)
  loop do
    drawn_suit = deck.keys.sample
    return drawn_suit if !deck[drawn_suit].empty?
  end
end

def rand_card!(deck)
  suit = rand_suit(deck)
  head = deck[suit].sample

  deck[suit].delete(head)

  init_card(suit, head)
end

def display_card(card, mask)
  head = if FACES.include?(card[:head]) || TWO_FACED.include?(card[:head])
           MSGS[card[:head].to_s]
         else
           card[:head]
         end

  if !mask
    prompt("#{head} #{MSGS['of']} #{MSGS[card[:suit].to_s]}")
  end
end

def busted?(player)
  player[:total_sum] > BLACKJACK
end

# Recalculates the players hand after a new card is added to the hand.
# rubocop: disable Metrics/AbcSize
def update_hand!(player, card)
  player[:cards] << card

  player[:non_ace_sum] += card[:head] if FACELESS.include?(card[:head])
  player[:non_ace_sum] += FACE_VALUE if FACES.include?(card[:head])

  player[:ace_count] += 1 if TWO_FACED.include?(card[:head])
  player[:aces_sum] = calc_aces(player) if !player[:ace_count].zero?

  player[:total_sum] = player[:non_ace_sum] + player[:aces_sum]
end
# rubocop: enable Metrics/AbcSize

def deal!(deck, player, mask = false)
  prompt "#{MSGS['dealing']} #{player_name(player)}..."

  card = rand_card!(deck)
  display_card(card, mask)

  update_hand!(player, card)
end

def blackjack?(player)
  player[:total_sum] == BLACKJACK
end

def hole?(dealer)
  dealer[:cards].count == HOLE
end

def next_hole?(dealer)
  dealer[:cards].count == NEXT_HOLE
end

def gambler_stay?(gambler)
  return true if blackjack?(gambler)

  options = [MSGS['hit'], MSGS['stay']]
  msg = "#{MSGS['decision']} #{joinor(options)}"

  hit_rgx = /^[\sh]/i
  stay_rgx = /^[\ss]/i

  stay = bool_fm_rgx_match_in_list(msg, stay_rgx, hit_rgx)
  prompt "#{MSGS['gambler']} #{MSGS['stays']}" if stay

  stay
end

def dealer_stay?(dealer)
  if dealer[:total_sum] >= HOUSE_RULE
    prompt("#{player_name(dealer)} #{MSGS['stays']}")
    true
  else
    prompt("#{player_name(dealer)} #{MSGS['hits']}")
    false
  end
end

def stay?(player)
  if player[:is_dealer] && dealer_stay?(player)
    wait_user
    true
  elsif !player[:is_dealer] && gambler_stay?(player)
    true
  end
end

# Returns the sum of aces in the player's hand.
# Aces may have a value of 1 or 11, but there may only be one ace with a value
# of 11, in any hand, without busting. We make an assumption that one ace in a
# hand is 11, all other ace's are 1. If this assupmtion causes the hand to
# bust, we make all ace's 1. Otherwise, we make one ace 11 and all other ace's
# 1, for the best possible hand.
# Examples:
# Hand is [2, 3, ace, ace]      => values are [2, 3, 11, 1]
# Hand is [2, 3, ace, ace, ace] => values are [2, 3, 1, 1, 1]
# Hand is [10, ace]             => values are [10, 11]
# Hand is [10, 10, ace]         => values are [10, 10, 1]
def calc_aces(player)
  total_sum_w_high_ace = player[:non_ace_sum] +
                         TWO_FACED_MAX +
                         (player[:ace_count] - 1) * TWO_FACED_MIN

  total_sum_w_low_ace = player[:non_ace_sum] +
                        player[:ace_count] * TWO_FACED_MIN

  total_sum = if total_sum_w_high_ace <= BLACKJACK
                total_sum_w_high_ace
              else
                total_sum_w_low_ace
              end

  total_sum - player[:non_ace_sum]
end

# Returns the player that won. Returns nil if tied.
def compare_hands(gambler, dealer)
  if busted?(gambler)
    dealer
  elsif busted?(dealer)
    gambler
  else
    case gambler[:total_sum] <=> dealer[:total_sum]
    when -1 then dealer
    when 1 then gambler
    end
  end
end

def display_tie
  prompt(MSGS['tie'])
end

def display_winner(player)
  prompt("#{player_name(player)} #{MSGS['win_round']}")
end

def display_result(winner)
  if winner.nil?
    display_tie
  else
    display_winner(winner)
  end
end

def game_over?(players)
  players.each do |player|
    if player[:score] == SCORE_LIMIT
      prompt("#{player_name(player)} #{MSGS['win_game']}")
      return true
    end
  end

  false
end

def discard_hands!(players)
  players.each do |player|
    player[:cards] = []
    player[:ace_count] = 0
    player[:non_ace_sum] = 0
    player[:aces_sum] = 0
    player[:total_sum] = 0
  end
end

def reset_scores!(players)
  players.each do |player|
    player[:score] = 0
  end
end

def update_score!(winner)
  winner[:score] += 1
end

def play_again?
  msg = MSGS['again']

  yes_rgx = /\by/i
  no_rgx = /\bn/i

  bool_fm_rgx_match_in_list(msg, yes_rgx, no_rgx)
end

clear_screen
display_rules
display_table_divider
wait_user
gambler = init_player(false)
dealer = init_player(true)
players = [gambler, dealer]

loop do
  clear_screen
  deck = init_deck

  DEAL_TIMES.times do |idx|
    # We must not show the dealer's second card and their hand's value until
    # it's the dealer's turn.
    mask = hole?(dealer)
    display_table(players, mask)

    player_idx = calc_player_idx(players, idx)

    # We must not show the dealer's next card draw, if it is their second card.
    mask = players[player_idx] == dealer && next_hole?(dealer)
    deal!(deck, players[player_idx], mask)

    wait_user
    clear_screen
  end

  catch :round_over do
    break if blackjack?(gambler)

    players.each do |player|
      next if blackjack?(player)

      loop do
        clear_screen
        display_table(players, !player[:is_dealer])

        if busted?(player)
          prompt("#{player_name(player)} #{MSGS['busts']}")
          wait_user
          throw :round_over
        elsif stay?(player)
          break
        end

        clear_screen
        display_table(players, !player[:is_dealer])

        deal!(deck, player)
        wait_user
      end
    end
  end

  winner = compare_hands(gambler, dealer)
  update_score!(winner) if !winner.nil?

  clear_screen
  display_table(players)
  display_result(winner)

  if game_over?(players)
    break if !play_again?
    reset_scores!(players)
  else
    wait_user
  end

  discard_hands!(players)
end
