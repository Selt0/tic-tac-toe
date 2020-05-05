class Computer
attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_pos(legal_positions)
    choice = legal_positions.sample
    puts "Computer #{mark} chose position #{choice.join(' ')}"
    choice
  end
end