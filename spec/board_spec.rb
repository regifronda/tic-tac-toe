require './lib/board'

describe Board do
  subject(:board) { described_class.new }
  
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