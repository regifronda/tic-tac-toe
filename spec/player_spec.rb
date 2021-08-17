require './lib/tictactoe'

describe Player do
  describe "#validate_coordinates_format" do
    subject(:player_input) { described_class.new("Player 1", :x, @board) }
    context "when given a valid input as an argument" do
      it "returns true" do
        user_input = [0, 0]
        verified_input = player_input.validate_coordinates_format(user_input)
        expect(verified_input).to be true
      end
    end

    context "when given a invalid input as an argument" do
      it "returns false" do
        invalid_input = [0, 0, 0]
        unverified_input = player_input.validate_coordinates_format(invalid_input)
        expect(unverified_input).to be false
      end
    end

    context "when given a long input as an argument" do
      it "returns false" do
        invalid_input = [1, 2, 3, 4, 5]
        unverified_input = player_input.validate_coordinates_format(invalid_input)
        expect(unverified_input).to be false
      end
    end
  end
end