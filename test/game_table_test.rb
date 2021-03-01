require "minitest/autorun"
require "minitest/pride"
require './lib/tables/game_table'
require "./lib/instances/game"
require './test/test_helper'
require './lib/stat_tracker'
require './lib/helper_modules/csv_to_hashable'

class GameTableTest < Minitest::Test
include CsvToHash
  def setup
    stat_tracker = nil
    locations = './data/games.csv'
    @game_table = GameTable.new(locations, stat_tracker)
  end

  def test_rival
    assert_equal "Houston Dash", @game_table.rival("18")

  end


end
