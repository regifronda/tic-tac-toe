require_relative 'player'

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

class Board
  def initialize
    @board = Array.new(3){Array.new(3)}
  end

  def render
    puts
    @board.each do |row|
      row.each do |cell|
      cell.nil? ? print("-") : print(cell.to_s)
      end
      puts
    end
    puts
  end

  def add_piece(coordinates, piece)
    if piece_location_valid?(coordinates)
      @board[coordinates[0]][coordinates[1]] = piece
      true
    else
      false
    end
  end

  def piece_location_valid?(coordinates)
    if within_valid_coordinates?(coordinates)
      coordinates_available?(coordinates)
    end
  end
  
  def within_valid_coordinates?(coordinates)
    if (0..2).include?(coordinates[0]) && (0..2).include?(coordinates[1])
      true
    else
      puts "Piece coordinates are outside of acceptable range."
    end
  end

  def coordinates_available?(coordinates)
    if @board[coordinates[0]][coordinates[1]].nil?
      true
    else
      puts "A piece is already there."
    end
  end

  def winning_combination?(piece)
    winning_diagonal?(piece) ||
    winning_vertical?(piece) ||
    winning_horizontal?(piece)
  end

  def winning_diagonal?(piece)
    diagonals.any? do |diagonal|
      diagonal.all? { |cell| cell == piece }
    end
  end

  def winning_horizontal?(piece)
    horizontals.any? do |horizontal|
      horizontal.all?{ |cell| cell == piece }
    end
  end

  def winning_vertical?(piece)
    verticals.any? do |vertical|
      vertical.all?{ |cell| cell == piece }
    end
  end

  def diagonals
    [[@board[0][0], @board[1][1], @board[2][2]], [@board[2][0], @board[1][1], @board[0][2]]]
  end
    
  def horizontals
    @board
  end

  def verticals
    verticals = []
    3.times do |i|
      verticals << [@board[0][i], @board[1][i], @board[2][i]]
    end
    verticals
  end

  def full?
    @board.all? do |row|
      row.none?(&:nil?)
    end
  end
end

game = TicTacToe.new
game.play