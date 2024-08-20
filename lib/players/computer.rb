require_relative "player"

# A computer that can play the game
class Computer < Player
  def initialize
    super
    @guesses = []
    (1..6).each do |v1|
      (1..6).each do |v2|
        (1..6).each do |v3|
          (1..6).each { |v4| @guesses.push(v1.to_s.concat(v2.to_s, v3.to_s, v4.to_s)) }
        end
      end
    end
  end

  protected

  def generate_code
    @guesses.sample
  end

  def check_code(guessed, code = @code)
    [full_correct(guessed, code).size, half_correct(guessed, code).size]
  end

  def get_guess(feedback)
    clean_guesses(feedback) if feedback
    @guesses[0]
  end

  private

  def full_correct(guessed, code)
    guessed.chars.each_with_index.select { |v, k| code[k] == v }
  end

  def half_correct(guessed, code)
    other_colors = not_full_correct(guessed, code)
    true_colors = not_in_code(guessed, code)
    other_colors.select do |v|
      true_colors.find do |tuple|
        next (tuple[2] = false) || true if (tuple[0] == v[0]) && tuple[2]
      end
    end
  end

  # Give elements that are not fully correct in guess
  def not_full_correct(guessed, code)
    guessed.chars.each_with_index.reject { |v2| full_correct(guessed, code).find { |v| v == v2 } }
  end

  # Give answers that are not fully correct in real code
  def not_in_code(guessed, code)
    code.chars.each_with_index.reject { |v2| full_correct(guessed, code).find { |v| v == v2 } }
        .map { |v| [v[0], v[1], true] }
  end

  def clean_guesses(feedback)
    @guesses.select! { |v| check_code(@guess, v) == feedback }
  end
end
