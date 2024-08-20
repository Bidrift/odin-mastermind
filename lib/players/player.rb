# A player that can be a guesser
module Guessable
  def guess(feedback)
    get_guess(feedback)
  end
end

# A player that can be a coder
module Codable
  def feedback(code)
    check_code(code)
  end

  def code
    @code = generate_code
  end
end

class Player
  include Codable
  include Guessable
end
