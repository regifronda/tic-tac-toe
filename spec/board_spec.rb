require './lib/board'
require './lib/player'
require './lib/tictactoe'

describe Board do
  subject(:board) { described_class.new }
  
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