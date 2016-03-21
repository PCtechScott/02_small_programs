# rock_paper_scissors.rb
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

def who_won(player, computer)
  if win?(player, computer)
    winner = "Player"
  elsif win?(computer, player)
    winner = "Computer"
  else
    winner = "Nobody"
  end
end

loop do

  player_score = 0
  computer_score = 0

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

    winner = who_won(player_choice, computer_choice)

    prompt("Winner: #{winner}")

    if winner == 'Player'
      player_score += 1
    elsif winner == 'Computer'
      computer_score += 1
    end

    prompt('Current Score:')
    prompt("Player - #{player_score}    Computer - #{computer_score}")


    if player_score == 5 or computer_score == 5
      prompt("#{winner} wins the match with 5 points!")
      break
    end
end

  prompt('Do you want to play again?')
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end


prompt('Thanks for playing! Goodbye!')
