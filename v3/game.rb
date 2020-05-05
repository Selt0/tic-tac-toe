require_relative 'board'
require_relative 'human_player'
require_relative 'computer'

class Game

  attr_reader :players, :current_player, 
              :board

  def initialize(size, marks = {})
    @board = Board.new(size)
    @players = marks.map{ |mark, comp| comp ? Computer.new(mark) :  Player.new(mark) }
    @current_player = players.first
  end

  def run
    until game_over?
      puts
      board.print
      puts
      choices = board.legal_positions
      player_pos = current_player.get_pos(choices)

      board.place_mark(current_player.mark, player_pos)

      if board.win?(current_player.mark)
        board.print
        return "Player #{current_player.mark} has won the game!"
      else
        switch_turns
      end
    end
    board.print
    puts
    return "DRAW!"
  end

  def switch_turns
    @current_player = players.rotate!.first
  end

  def game_over?
    !board.empty_positions?
  end
end