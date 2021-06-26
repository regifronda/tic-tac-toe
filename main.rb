class TicTacToe
  def initialize
    @board = Board.new

    @player_x = Player.new("Player 1", :x, @board)
    @player_o = Player.new("Player 2", :o, @board)

    @current_player = player_x
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
      @current_player = @player_y
    else
      @current_player = @player_x
    end
  end
end

class Player
  attr_accessor :name, :piece

  def initalize(name = "Player_placeholder", piece, board)
    @name = name
    @piece = piece
    @board = board
  end

  def get_coordinates
    loop do
      coordinates = ask_for_coordinates
      if validate_coordinates_format(coordinates)
        if @board.add_piece(coordinates, @piece)
          break
        end
      end
    end
  end

  def ask_for_coordinates
    puts "#{@name}(#{@piece}), enter your coordinates in the form x,y:"
    gets.strip.split(",").map(&:to_i)
  end

  def validate_coordinates_format(coordinates)
    if coordinates.is_a?(Array) && coordinates.size == 2
      true
    else
      puts "Error: your coordinates aren't in the right format."
    end
  end
end

class Board
  #initialize board
  def initialize
    @board = Array.new(3){Array.new(3)}
  end

  #render 
  def render
    puts
    #loop through data structure
    @board.each do |row|
      row.each do |cell|
      #display an existing marker if any, else blank
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

  #winning_combination
    #is there a winning_diagonal?
    #or winning_vertical?
    #or winning_horizontal? for that piece?
  
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
  
  #winning_horizontal
    #check if there's three of the specified piece across
  
  def diagonals
    [[@board[0][0], @board[1][1], @board[2][2]], [@board[2][0], @board[1][1], @board[0][2]]]
  end
  
  #switch vertical and horizontal methods to make sense!!!!!!!!
  
  def horizontals
    @board
  end

  #horizontals
    #return horizontal pieces
  
  #full?
    #does every square have a piece?
end