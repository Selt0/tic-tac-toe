require_relative 'board'
require_relative 'human_player'

class Game

  attr_reader :players, :current_player, 
              :board

  def initialize(size, player1_mark, player2_mark)
    @board = Board.new(size)
    @players = [Player.new(player1_mark), Player.new(player2_mark)]
    @current_player = players.first
  end

  def run
    until game_over?
      #print the board
      puts
      board.print
      puts
      #get position from player
      #mark the board
      board.place_mark(current_player.mark, current_player.get_pos)

      if board.win?(current_player.mark)
        board.print
        return "Player #{current_player.mark} has won the game!"
      else
        switch_turns
      end
    end
    board.print
    puts
    puts "DRAW!"
  end

  def switch_turns
    @current_player = players.rotate!.first
  end

  def game_over?
    !board.empty_positions?
  end
end