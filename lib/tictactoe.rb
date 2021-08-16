class TicTacToe
  def initialize
    @board = Board.new

    @player_x = Player.new("Player 1", :x, @board)
    @player_o = Player.new("Player 2", :o, @board)

    @current_player = @player_x
  end

  def play
    loop do
      @board.render
      @current_player.get_coordinates
      break if check_game_over
      switch_players
    end
  end

  def check_game_over
    check_victory || check_draw
  end

  def check_victory
    if @board.winning_combination?(@current_player.piece)
      puts "Congratulations! You win, #{@current_player.name}!"
      true
    else
      false
    end
  end  

  def check_draw
    if @board.full?
      puts "Too bad, it's a draw!"
      true
    else
      false
    end
  end

  def switch_players
    if @current_player == @player_x
      @current_player = @player_o
    else
      @current_player = @player_x
    end
  end
end