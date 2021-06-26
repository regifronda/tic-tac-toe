class TicTacToe
  def initialize
    @board = Board.new

    @player_x = Player.new("Player 1", :x, @board)
    @player_o = Player.new("Player 2", :o, @board)

    @current_player = player_x
  end

  #play
    #loop infinitely
      #call board rendering method
      #ask for coordinates from current player
      #if the game is over, break the loop
      #switch players

  #check_game_over
    #check_victory
    #check_draw
  
  #check_victory
    #if board says current player's piece has winning_combination
    #print victory message
    
  #check_draw
    #if board is filled up
      #print draw message

  #switch_players
    #player_x to player_o or vice versa
end

class Player
  attr_accessor :name, :piece

  def initalize(name = "Player_placeholder", piece, board)
    @name = name
    @piece = piece
    @board = board
  end

  #get_coordinates
    #loop infinitely
      #ask_for_coordinates
      #if validate_coordinates_format is true
        #if piece can be placed on Board
          #break the loop
  
  #ask_for_coordinates
    #display message asking for coordinates
    #pull coordinates from command line

  #validate_coordinates_format
    #unless coordinates are in the proper format
      #display error message
end

class Board
  #initialize board
    #set up blank data structure

  #render 
    #loop through data structure
      #display an existing marker if any, else blank
  
  #add_piece
    #if piece_location_valid?
      #place piece
    #else
      #print error message
    
  #piece_location_valid?
    #is the input within_valid_coordinates?
    #are the piece coordinates_free?
  
  #within_valid_coordinates?
    #unless piece coordinates are in the acceptible range
      #display an error message

  #coordinates_free?
    #unless piece coordinates are not occupied
      #display error message
  
  #winning_combination
    #is there a winning_diagonal?
    #or winning_vertical?
    #or winning_horizontal? for that piece?
  
  #winning_diagonal?
    #check if there's three of the specified piece across diagonals
  
  #winning_vertical?
    #check if there's three of the specified piece across verticals
  
  #winning_horizontal
    #check if there's three of the specified piece across
  
  #diagonals
    #return diagonal pieces
  
  #verticals
    #return vertical pieces
  
  #horizontals
    #return horizontal pieces
  
  #full?
    #does every square have a piece?
end