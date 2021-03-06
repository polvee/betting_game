# Single player game where the player starts with $100.

# The player is asked to bet an amount for that guess.

# The player is prompted to guess an number between 1 and 10. If they guess the number correctly, they double their bet. If they guess within a range of 1 then they get to keep their bet. If they're off by more than 1, then then lose their bet.

# The player can continue to play multiple turns until they run out of money or get bored (and quit)

# REPL - Read Eval Print Loop.
# Need to generate a random number (hopefully with Ruby's help)
# Need to take in user input (bet and then guess)
# Methods:
# * generate_random_number
# * check_guess(guess, actual)
# Variables for managing the state of the game
# * bank_balance = 100
# * amount_won, wins, losses, player's name, etc ???

@bank = 100

def get_valid_bet
  puts "You have $#{@bank}, what's your bet?"
  bet = gets.chomp
  # TODO: Validate the bet (not too high or too low, a number)
end

def get_valid_guess
  puts "Guess a number between 1 and 10"
  guess = gets.chomp
  # TODO: Validate the guess and don't crap out if the guess in invalid, ask again.
end

def generate_winning_number
  5
end

def perfect_guess?(guess, winning_number)
  guess.to_i == winning_number
end

def increase_bank!(bet)
  @bank = @bank - bet.to_i
  @bank = @bank + (bet.to_i * 2)
end

def off_by_1?(guess, winning_number)
  (guess.to_i - winning_number).abs == 1
end

def lose_bet!(bet)
  @bank = @bank - bet.to_i
end

def evaluate_guess(guess, winning_number, bet)
  # Compare the guess against the random number
  if perfect_guess?(guess, winning_number)
    puts "You nailed it!"
    increase_bank!(bet)
  elsif off_by_1?(guess, winning_number)
    puts "Off by just one, you get to keep your doh!"
  else
    lose_bet!(bet)
    puts "Sorry, the real number was #{winning_number}"
  end
end

loop do
  bet = get_valid_bet
  # TODO: Player should be able to quit at this point
  winning_number = generate_winning_number # FIXME: This should be rand between 1 and 10
  guess = get_valid_guess
  evaluate_guess(guess, winning_number, bet)
end
