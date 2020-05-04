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
end