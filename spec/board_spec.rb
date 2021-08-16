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
  end
end