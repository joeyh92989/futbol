require_relative '../helper_modules/csv_to_hashable.rb'
require_relative '../instances/game'
class GameTable
  attr_reader :game_data, :stat_tracker
  include CsvToHash
  def initialize(locations)
    @game_data = from_csv(locations, 'Game')
    @stat_tracker = stat_tracker
  end

  def highest_total_score
    @game_data.map {|game| game.away_goals + game.home_goals}.max
  end

  def lowest_total_score
    @game_data.map { |game| game.away_goals + game.home_goals}.min
  end

  def percentage_home_wins
    wins = 0
    total = @game_data.map { |game| wins += 1 if game.home_goals > game.away_goals }.count
    percentage = (wins.to_f / @game_data.count).round(2)
    # require "pry"; binding.pry
    percentage
    end

  def percentage_away_wins
    wins = 0
    total = @game_data.map { |game| wins += 1 if game.home_goals < game.away_goals }.count
    percentage = (wins.to_f / @game_data.count).round(2)
  end

  def percentage_ties
    wins = 0
    total = @game_data.map { |game| wins += 1 if game.home_goals == game.away_goals }.count
    percentage = (wins.to_f / @game_data.count).round(2)
  end

  def count_of_games_by_season
    s20122013 = []
      @game_data.find_all do |game|
        s20122013 << game.season if game.season.to_s.include?("20122013")
      end
    s20162017 = []
      @game_data.find_all do |game|
        s20162017 << game.season if game.season.to_s.include?("20162017")
      end
    s20142015 = []
      @game_data.find_all do |game|
        s20142015 << game.season if game.season.to_s.include?("20142015")
      end
    s20152016 = []
      @game_data.find_all do |game|
        s20152016 << game.season if game.season.to_s.include?("20152016")
      end
    s20132014 = []
      @game_data.find_all do |game|
        s20132014 << game.season if game.season.to_s.include?("20132014")
      end
    s20172018 = []
      @game_data.find_all do |game|
        s20172018 << game.season if game.season.to_s.include?("20172018")
      end
    result = {
      "20122013"=> s20122013.count,
      "20162017"=> s20162017.count,
      "20142015"=> s20142015.count,
      "20152016"=> s20152016.count,
      "20132014"=> s20132014.count,
      "20172018"=> s20172018.count
    }
  end

  def average_goals_per_game
    hash = Hash.new
    seasons = @games.game_data.group_by{|game| game.season}
    seasons.map{|season| hash[season[0].to_s] = (season[1].map{|game| game.home_goals + game.away_goals}.sum.to_f / season[1].length).round(2)}
    hash
   end

  def game_by_season
    season = @game_data.group_by do |game|
      game.season
    end
  end
  # def favorite_opponent(results)
  #   away = results.map{|result| @game_data.find{|game| game.game_id == result[0]}.away_team_id}
  #   results = results.map{|result| @game_data.find{|game| game.game_id == result[0]}.home_team_id}.zip(away).zip(results)
  # end
end

