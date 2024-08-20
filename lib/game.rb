require "colorize"

# Our game class
class Game
  @modes = {
    "0": "Play as guesser",
    "1": "Play as coder"
  }
  def initialize
    puts "Starting game...".colorize(:green)
    fetch_mode
    create_players
    run_game
  end

  private

  def fetch_mode
    Prompter.put_options(@modes)
    Prompter.gets_match(/^[0-1]$/)
  end

  def create_players
    puts "Creating players".colorize(:green)
    @players = Array.new(2)
    @coder = @mode == "0" ? Computer.new : Human.new
    @guesser = @mode == "1" ? Human.new : Computer.new
  end

  def run_game
    @code = @coder.get_code
    (1..12).each do |round|
      puts "Round #{round}".colorize(:green)
      current_guess = @guesser.guess(@feedback)
      @feedback = @coder.feedback(current_guess)
      show_feedback(@feedback)
      break if solved?(@feedback)
    end
    show_winner
  end

  def show_winner
    if solved?(@feedback)
      puts "Code (#{@code}) was found, guesser wins".colorize(:green)
    else
      puts "Code (#{@code}) was not found, coder wins".colorize(:green)
    end
  end

  def show_feedback(feedback)
    puts "There are ".concat("#{feedback[0]} correct colors placed correctly".colorize(:green), " and ",
                             "#{feedback[1]} correct colors placed wrongly".colorize(:yellow))
  end

  def solved?(feedback)
    feedback[0] == 4
  end
end
