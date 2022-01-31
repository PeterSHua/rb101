require "pry"
VALID_CHOICES = %w(rock paper scissors lizard spock)
RULES = {
  rock: %w(scissors lizard),
  paper: %w(rock spock),
  scissors: %w(paper lizard),
  lizard: %w(paper spock),
  spock: %w(rock scissors)
}

def test_method
  prompt('test message')
end

def win?(first, second)
  RULES[first.to_sym].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

player_wins = 0
computer_wins = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().downcase

    choice =  if choice.start_with?('r') then VALID_CHOICES[0]
              elsif choice.start_with?('p') then VALID_CHOICES[1]
              elsif choice.start_with?('sc') then VALID_CHOICES[2]
              elsif choice.start_with?('l') then VALID_CHOICES[3]
              elsif choice.start_with?('sp') then VALID_CHOICES[4]
              else
                prompt("That's not a valid choice.")
                next
              end
    break
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice) then player_wins += 1
  elsif win?(computer_choice, choice) then computer_wins += 1
  end

  if player_wins == 3
    prompt("You won the match")
    break
  elsif computer_wins == 3
    prompt("Computer won the match")
    break
  end
end

prompt("Thanks for playing, goodbye!")
