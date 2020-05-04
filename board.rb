class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(3) {Array.new(3, '_') }
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, mark)
    x, y = pos
    grid[x][y] = mark
  end

  def valid?(pos)
    pos.all?{ |ele| ele.between?(0, grid.length)}
  end

  def empty?(pos)
    self[pos] == '_'
  end

  def place_mark(mark, pos)
    if valid?(pos) && empty?(pos)
      self[pos] = mark 
    else   
      raise "Invalid position"
    end
  end

  def print
    pretty_board = grid.map do |row|
      row.map.with_index do |mark, i|
        if i == grid.length / 2
         " | #{mark.to_s} | "
        else
          mark
        end
      end
    end
    puts "  #{(0...grid.length).to_a.join('   ')}"

    pretty_board.each_with_index do |row, i|
      puts "#{i} #{row.join('')}"
      break if i == grid.length - 1
      puts "  #{'-'*grid.length ** 2}"
    end
  end
  
  def win_row?(mark)
    grid.any?{|row| row.all?(mark)}
  end

  def win_col?(mark)
    grid.transpose.any?{ |col| col.all?(mark)}
  end

  def win_diagonal?(mark)
    left_to_right = (0...grid.length).collect { |i| [i,i] }
    right_to_left = (0...grid.length).collect { |i| [i, -i - 1] }
    
    left_to_right.all?{ |pos| self[pos] == mark} ||
    right_to_left.all?{ |pos| self[pos] == mark}
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

end