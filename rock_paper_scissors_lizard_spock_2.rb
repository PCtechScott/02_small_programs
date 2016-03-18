# rock_paper_scissors_lizard_spock.rb
# 02_small_programs

VALID_CHOICES = %w(rock paper scissors lizard Spock)
VALID_INPUTS = %w(r p s l S)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
    (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'Spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'Spock' || second == 'paper')) ||
    (first == 'Spock' && (second == 'scissors' || second == 'rock'))
end

def display_results(winner)
  prompt("Winner: #{winner}")
  prompt("Current scores:")
#  prompt("Player: #{scores[0]}")
#  prompt("Computer: #{scores[1]}")
#  prompt("Ties: #{scores[2]}")
end

def determine_winner(player, computer)
  if win?(player, computer)
    winner = 'Player'
  elsif win?(computer, player)
    winner = 'Computer'
  else
    winner = 'none'
  end
end

def increment_score(winner)
  if winner == 'Player'
    scores[0] += 1
  elsif winner == 'Computer'
    scores[1] += 1
  else
    scores[2] += 1
  end
end

scores = [0, 0, 0] # player wins, computer wins, ties

loop do
  choice = ''
  player_choice = ''
  winner = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("Enter just the first letter. Note that the choice is")
    prompt("case-sensitive, i.e. 's' for scissors and 'S' for Spock.")
    choice = Kernel.gets.chomp

    if VALID_INPUTS.include?(choice)
      player_choice = VALID_CHOICES[VALID_INPUTS.index(choice)]
      break
    else
      prompt("That's not a valid choice.")
    end

  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}")

  determine_winner(player_choice, computer_choice)
  # increment_score(winner)

  display_results(winner)

  prompt('Do you want to play again?')
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt('Thanks for playing! Goodbye!')
