#Controls gameplay
class TicTacToe
  def initialize
    @board = Board.new

    @player_x = Player.new("Player 1", :x, @board)
    @player_o = Player.new("Player 2", :o, @board)

    #Assign starting player
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
end
#Set up the game itself [TicTacToe]by
  #Initalize the game board [Board]
  #Initialize two players [Player1 and Player2]
#Start gameplay loop [TicTacToe]
  #Display the board [Board]
  #Ask for player input and check if formatted correctly[PlayerInput]
  #If there's a draw or win [TicTacToe]
    #Print victory or draw message
    #Stop looping
  #Else
    #Switch to next player
    #resume loop [TicTacToe]
