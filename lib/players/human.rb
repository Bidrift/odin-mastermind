require_relative "player"

# A real player that can play the game
class Human < Player
  protected

  def fetch_guess(feedback)
    puts "Choose a four-digit code consisting of 1-6s (Ex: 1652)".colorize(:red)
    Prompter.gets_match(/^[1-6]{4}$/)
  end

  def check_code(code)
    puts "Based on #{code}, how many colors are correct and placed correctly? (0-4)".colorize(:red)
    first = Prompter.gets_i_match(/^[0-4]$/)
    puts "Based on #{code}, how many colors are correct and placed wrongly? (0-4)".colorize(:yellow)
    second = Prompter.gets_i_match(/^[0-4]$/)
    [first, second]
  end

  def generate_code
    puts "Choose a four-digit code consisting of 1-6s (Ex: 1652)".colorize(:red)
    Prompter.gets_match(/^[1-6]{4}$/)
  end
end
