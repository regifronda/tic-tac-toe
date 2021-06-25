class TicTacToe
  def initialize
    @board = Board.new

    @player_x = Player.new("Player 1", :x, @board)
    @player_o = Player.new("Player 2", :o, @board)


  end
end

class Player
  attr_accessor :name, :piece

  def initalize(name = "Player_placeholder", piece, board)
    @name = name
    @piece = piece
    @board = board
  end
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
