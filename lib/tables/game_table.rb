require_relative '../helper_modules/csv_to_hashable'
require_relative '../instances/game'
class GameTable
  attr_reader :game_data, :stat_tracker
  include CsvToHash
  def initialize(locations, stat_tracker)
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
    total = @game_data.map do |game|
      wins += 1 if game.home_goals > game.away_goals
    end
    total.count
    percentage = (wins.to_f / @game_data.count).round(2)
    percentage
  end

  def percentage_away_wins
    wins = 0
    total = @game_data.map do |game|
      wins += 1 if game.home_goals < game.away_goals
    end
    total.count
    percentage = (wins.to_f / @game_data.count).round(2)
    percentage
  end

  def percentage_ties
    wins = 0
    total = @game_data.map do |game|
      wins += 1 if game.home_goals == game.away_goals
    end
    total.count
    percentage = (wins.to_f / @game_data.count).round(2)
    percentage
  end

  def count_of_games_by_season
    games_by_season_hash = @game_data.group_by {|game| game.season.to_s}
    result = games_by_season_hash.each do |season, games|
      games_by_season_hash[season] = games.count
    end
    result
  end

  def average_goals_per_game
    total_games = @game_data.count
    total_goals = @game_data.flat_map {|game| game.away_goals + game.home_goals}
    average = (total_goals.sum.to_f / total_games).round(2)
    average
  end

  def average_goals_by_season

    games_by_season_hash = @game_data.group_by {|game| game.season.to_s}


    goals = games_by_season_hash.each do |season, game|
      games_by_season_hash[season] = ((game.map {|indvidual_game| indvidual_game.away_goals.to_f + indvidual_game.home_goals.to_f}).sum/ game.count).round(2)

    end
    goals
  end

  def game_by_season
    season = @game_data.group_by do |game|
      game.season
    end
    season
  end
  def favorite_opponent(results)
    away = results.map{|result| @game_data.find{|game| game.game_id == result[0]}.away_team_id}
    results = results.map{|result| @game_data.find{|game| game.game_id == result[0]}.home_team_id}.zip(away).zip(results)

  end

  def rival(team_id_str)
    results = team_id_str.to_i
    home = results.map{|result| @game_data.find{|game| game.game_id == result[0]}.home_team_id}
    results = results.map{|result| @game_data.find{|game| game.game_id == result[0]}.away_team_id}.zip(home).zip(new_results)
    games = @game_teams.find_team_games(team_id_str).map{|game|[game.game_id,game.result]}

  end
end
