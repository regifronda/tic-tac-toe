require './lib/board'
require './lib/player'
require './lib/tictactoe'

describe Board do
  subject(:board) { described_class.new }

  describe "#winning_diagonal?" do
    context "when the board is empty" do
      before do
        board.instance_variable_set(:@board, [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
      end

      it "returns false" do
        test_piece = :x
        diagonal_check = board.winning_diagonal?(test_piece)
        expect(diagonal_check).to be_falsy
      end
    end

    context "when 2 of 3 diagonal squares have the same piece" do
      before do
        board.instance_variable_set(:@board, [[:x, nil, nil], [nil, :x, nil], [nil, nil, nil]])
      end
      
      it "returns false" do
        test_piece = :x
        diagonal_check = board.winning_diagonal?(test_piece)
        expect(diagonal_check).to be_falsy
      end
    end

    context "when top left, center, and bottom right squares have the same piece" do
      before do
        board.instance_variable_set(:@board, [[:x, nil, nil], [nil, :x, nil], [nil, nil, :x]])
      end
      
      it "returns true" do
        test_piece = :x
        diagonal_check = board.winning_diagonal?(test_piece)
        expect(diagonal_check).to be true
      end
    end

    context "when top right, center, and bottom left squares have the same piece" do
      before do
        board.instance_variable_set(:@board, [[nil, nil, :x], [nil, :x, nil], [:x, nil, nil]])
      end
      
      it "returns true" do
        test_piece = :x
        diagonal_check = board.winning_diagonal?(test_piece)
        expect(diagonal_check).to be true
      end
    end
  end

  describe "#winning_vertical?" do
    context "when the board is empty" do
      before do
        board.instance_variable_set(:@board, [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
      end
      
      it "returns false" do
        test_piece = :x
        vertical_check = board.winning_vertical?(test_piece)
        expect(vertical_check).to be_falsy
      end
    end

    context "when 2 of 3 vertical squares have the same piece" do
      before do
        board.instance_variable_set(:@board, [[:x, nil, nil], [:x, nil, nil], [nil, nil, nil]])
      end
      
      it "returns false" do
        test_piece = :x
        vertical_check = board.winning_vertical?(test_piece)
        expect(vertical_check).to be_falsy
      end
    end

    context "when the left column has 3 of the same piece" do
      before do
        board.instance_variable_set(:@board, [[:x, nil, nil], [:x, nil, nil], [:x, nil, nil]])
      end
      
      it "returns true" do
        test_piece = :x
        vertical_check = board.winning_vertical?(test_piece)
        expect(vertical_check).to be_truthy
      end
    end

    context "when the middle column has 3 of the same piece" do
      before do
        board.instance_variable_set(:@board, [[nil, :x, nil], [nil, :x, nil], [nil, :x, nil]])
      end
      
      it "returns true" do
        test_piece = :x
        vertical_check = board.winning_vertical?(test_piece)
        expect(vertical_check).to be_truthy
      end
    end

    context "when the right column has 3 of the same piece" do
      before do
        board.instance_variable_set(:@board, [[nil, nil, :x], [nil, nil, :x], [nil, nil, :x]])
      end
      
      it "returns true" do
        test_piece = :x
        vertical_check = board.winning_vertical?(test_piece)
        expect(vertical_check).to be_truthy
      end
    end
  end

  describe "#winning_horizontal?" do
    context "when the board is empty" do
      before do
        board.instance_variable_set(:@board, [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
      end
      
      it "returns false" do
        test_piece = :x
        horizontal_check = board.winning_horizontal?(test_piece)
        expect(horizontal_check).to be_falsy
      end
    end

    context "when 2 of 3 horizontal squares have the same piece" do
      before do
        board.instance_variable_set(:@board, [[:x, :x, nil], [nil, nil, nil], [nil, nil, nil]])
      end
      
      it "returns false" do
        test_piece = :x
        horizontal_check = board.winning_horizontal?(test_piece)
        expect(horizontal_check).to be_falsy
      end
    end

    context "when the top row has the same piece" do
      before do
        board.instance_variable_set(:@board, [[:x, :x, :x], [nil, nil, nil], [nil, nil, nil]])
      end
      
      it "returns true" do
        test_piece = :x
        horizontal_check = board.winning_horizontal?(test_piece)
        expect(horizontal_check).to be_truthy
      end
    end

    context "when the middle row has the same piece" do
      before do
        board.instance_variable_set(:@board, [[nil, nil, nil], [:x, :x, :x], [nil, nil, nil]])
      end
      
      it "returns true" do
        test_piece = :x
        horizontal_check = board.winning_horizontal?(test_piece)
        expect(horizontal_check).to be_truthy
      end
    end

    context "when the bottom row has the same piece" do
      before do
        board.instance_variable_set(:@board, [[nil, nil, nil], [nil, nil, nil], [:x, :x, :x]])
      end
      
      it "returns true" do
        test_piece = :x
        horizontal_check = board.winning_horizontal?(test_piece)
        expect(horizontal_check).to be_truthy
      end
    end
  end

  describe "#full?" do
    context "when board is empty" do
      before do
        board.instance_variable_set(:@board, [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
      end

      it "is not full" do
        expect(board).not_to be_full
      end
    end

    context "when board is partially filled out" do
      before do
        board.instance_variable_set(:@board, [[nil, :o, nil], [:x, nil, nil], [:x, nil, nil]])
      end

      it "is not full" do
        expect(board).not_to be_full
      end
    end

    context "when board is completely filled out" do
      before do
        board.instance_variable_set(:@board, [[:x, :o, :x], [:x, :x, :o], [:o, :o, :x]])
      end

      it "is is full" do
        expect(board).to be_full
      end
    end
  end
end