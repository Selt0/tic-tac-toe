class Player

  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_pos(legal_positions)
    pos = nil

    until legal_positions.include?(pos)
      puts "Player #{mark}, enter a position on the board (e.g., 0 1)"
      print "> "
      begin
        pos = parse_pos(gets.chomp)  
        raise if !valid_pos?(pos) || !legal_positions.include?(pos)
      rescue => exception
        puts
        puts "Invalid position. (Make sure you use a space!)"
        puts
        pos = nil
      end
    end
    pos
  end

  def valid_pos?(pos)
    pos.length == 2 && pos.is_a?(Array)
  end

  def parse_pos(pos)
    pos.split.map(&:to_i)
  end
end