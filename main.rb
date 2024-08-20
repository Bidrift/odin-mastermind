require_relative "lib/game"

options = {
  "0": "Restart the game",
  "1": "Quit"
}

loop do
  Game.new
  Prompter.put_options(options)
  choice = Prompter.gets_match(/^[0-1]$/)
  break if choice == "1"
end
