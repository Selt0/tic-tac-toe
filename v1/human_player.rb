class Player

  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_pos
    puts "Player #{mark}, enter a position on the board (e.g., 0 1)"
    print "> "

    pos = parse_pos(gets.chomp)  
    raise "Invalid position. (Make sure you only put in two numbers)" if !valid_pos?(pos)

    pos
  end

  def valid_pos?(pos)
    pos.length == 2 && pos.is_a?(Array)
  end

  def parse_pos(pos)
    pos.split.map(&:to_i)
  end
end