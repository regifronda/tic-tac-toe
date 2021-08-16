class Player
  attr_accessor :name, :piece

  def initialize(name = "Player_placeholder", piece, board)
    raise "Piece must be a Symbol!" unless piece.is_a?(Symbol)
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