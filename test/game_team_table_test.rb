require "minitest/autorun"
require "minitest/pride"
require './lib/tables/game_team_tables'
require "./lib/instances/game"
require './test/test_helper'
require './lib/stat_tracker'
require './lib/helper_modules/csv_to_hashable'

class GameTeamTableTest < Minitest::Test
  include CsvToHash
  include ReturnTeamable
  def setup
    stat_tracker = StatTracker.new()
    locations = './data/game_teams.csv'
    @game_table = GameTeamTable.new(locations, stat_tracker)
  end

  def test_average_win_percentage

    assert_equal 0.49, @game_table.average_win_percentage("6")
  end
end
