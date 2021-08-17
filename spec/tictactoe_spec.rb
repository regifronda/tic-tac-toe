require './lib/tictactoe'
require './lib/player'
require './lib/board'
describe TicTacToe do
  describe "#switch_players" do
    subject(:game_player) { described_class.new }
    context "@current_player is @player_x" do
      it "switches @current_player from @player_x to @player_o" do
        expect { game_player.switch_players }.to change { game_player.instance_variable_get(:@current_player) }
      end
    end
    context "@current_player is @player_o" do
      before do
        game_player.instance_variable_set(:@current_player, @player_o)
      end

      it "switches @current_player from @player_o to @player_x" do
        expect { game_player.switch_players }.to change { game_player.instance_variable_get(:@current_player) }
      end
    end
  end
end