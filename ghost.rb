class Ghost

  ALPHABET = Set.new("a".."z")
  MAX_LOSS_COUNT = 5

  def initialize(*players)
    words = File.readlines("dictionary.txt").map(&:chomp)  # to_proc
    # chomp: Returns a new String with the given record separator removed from the end of str
    @dictionary = Set.new(words)
    @players = players 
    @losses = Hash.new{ |losses, player| losses[player] = 0 }
  end 

  def run 
    play_round until game_over?
    puts "#{winner} wins!"
  end 

  private 

  attr_reader :fragment, :dictionary, :losses, :players

  def game_over?
    remaining_players == 1
  end

  def play_round 
    @fragment = ""
    welcome 

      until round_over?
        take_turn 
        next_player!
      end 

    update_standings
  end 

  #helper_method

  def round_over?
    
  end

  def next_player!

  end


  #UI method

  def take_turn 
    system("clear")

  end

  def display_standings

  end 

  def update_standings
  
  end

end 

if $PROGRAM_NAME == __FILE__
  game = Ghost.new(Player.new("Steve"), Player.new("breakfast"))
  game.run

end