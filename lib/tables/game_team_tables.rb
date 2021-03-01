require './lib/helper_modules/csv_to_hashable'
require './lib/helper_modules/team_returnable'
require './lib/instances/game_team'

class GameTeamTable
  include CsvToHash
  include ReturnTeamable
  attr_reader :game_team_data, :teams, :stat_tracker
  def initialize(locations, stat_tracker)
    @game_team_data = from_csv(locations, 'GameTeam')
    @stat_tracker = stat_tracker
  end


  def average_win_percentage(team_id)
    id_int = team_id.to_i
    win_percent = 0
    total_games = 0
    @game_team_data.each do |game|
      win_percent += 1 if (game.team_id == id_int) && (game.result == "WIN")
      total_games += 1 if (game.team_id == id_int)
    end
      (win_percent.to_f / total_games).round(2)
  end

  def best_season(team_id)
    array = []
    hash = Hash.new()
    @game_team_data.find_all{|game| game.team_id == team_id}.map{|game| array << [game.game_id, game.result]}
    array = array.group_by{|line| line[0].to_s.split('')[0..3].join}
    array.map{|season| hash[season[0]] = season[1].find_all{|game| game[1] == 'WIN'}.length.to_f / season[1].length}
    hash.max_by {|team| team[1]}[0]
  end

  def fewest_goals_scored(team_id_str)
    @game_team_data.find_all{|game| game.team_id == team_id_str.to_i}.min_by{|game| game.goals}.goals
  end
end
