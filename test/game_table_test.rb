# require "minitest/autorun"
# require "minitest/pride"
# require './lib/tables/game_table'
# require "./lib/instances/game"
# require './test/test_helper'
# require './lib/stat_tracker'
# require './lib/helper_modules/csv_to_hashable'
#
# class GameTableTest < Minitest::Test
# include CsvToHash
#   def setup
#     game_path = './data/games.csv'
#     team_path = './data/teams.csv'
#     game_teams_path = './data/game_teams.csv'
#     teams_test_path = './data/teams_test.csv'
#     games_test_path = './data/games_test.csv'
#     game_teams_test_path = './data/game_teams_test.csv'
#
#     locations = {
#       games: game_path,
#       teams: team_path,
#       game_teams: game_teams_path,
#     }
#     @stat_tracker = StatTracker.from_csv(locations)
#     @game_table = GameTable.new(locations[:games])
#   end
#
#   def test_it_exists
#     assert_instance_of GameTable, @game_table
#   end
#
#   def test_highest_total_score
#     assert_equal 11, @game_table.highest_total_score
#   end
#
#   def test_lowest_total_score
#     assert_equal 0, @game_table.lowest_total_score
#   end
#
#   def test_percentage_of_home_wins
#     assert_equal 0.44, @game_table.percentage_home_wins
#   end
#
#   def test_percentage_of_away_wins
#     assert_equal 0.36, @game_table.percentage_away_wins
#   end
#
#   def test_percentage_of_ties
#     assert_equal 0.20, @game_table.percentage_ties
#   end
#
#   def test_count_of_games_by_season
#     expected = {
#       "20122013"=>806,
#       "20162017"=>1317,
#       "20142015"=>1319,
#       "20152016"=>1321,
#       "20132014"=>1323,
#       "20172018"=>1355
#     }
#     assert_equal expected, @game_table.count_of_games_by_season
#   end
#
#   def test_average_goals_per_game
#     assert_equal 4.22, @game_table.average_goals_per_game
#   end
#
#   def test_average_goals_per_season
#     expected = {
#       "20122013"=>4.12,
#       "20162017"=>4.23,
#       "20142015"=>4.14,
#       "20152016"=>4.16,
#       "20132014"=>4.19,
#       "20172018"=>4.44
#     }
#     assert_equal expected, @game_table.average_goals_by_season
#   end
#
#   def test_favorite
#     skip
#
#   end
#
#   def test_rival
#     assert_equal "Houston Dash", @stat_tracker.rival("18")
#   end
# end
