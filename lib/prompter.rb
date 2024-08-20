require "colorize"

# A class that asks for a specific input
class Prompter
  def self.gets_match(reg_exp)
    throw TypeError.new("Regexp expected") unless reg_exp.instance_of?(Regexp)
    loop do
      x = gets.chomp
      return x if x.match?(reg_exp)

      puts "Invalid input".colorize(:red)
    end
  end

  def self.gets_i_match(reg_exp)
    throw TypeError.new("Regexp expected") unless reg_exp.instance_of?(Regexp)
    loop do
      x = gets.chomp
      return x.to_i if x.to_i.to_s.match?(reg_exp)

      puts "Invalid input".colorize(:red)
    end
  end

  def self.put_options(obj)
    puts "Choose an option (#{obj.keys.first}-#{obj.keys.last})".colorize(:red)
    obj.each { |k, v| puts "#{k} - #{v}" }
  end
end
