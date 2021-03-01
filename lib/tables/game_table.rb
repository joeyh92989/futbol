require './lib/helper_modules/csv_to_hashable.rb'
require './lib/instances/game'
class GameTable
  attr_reader :game_data, :stat_tracker
  include CsvToHash
  def initialize(locations, stat_tracker)
    @game_data = from_csv(locations, 'Game')
    @stat_tracker = stat_tracker
  end


  def rival(results_string)
    results = results_string.to_i
    home = results.map{|result| @game_data.find{|game| game.game_id == result[0]}.home_team_id}
    new_results = results.map{|result| @game_data.find{|game| game.game_id == result[0]}.away_team_id}.zip(home).zip(new_results)

 end

end
