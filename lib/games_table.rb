require './stat_tracker'

class GamesTable
  def initialize(csv_file, stat_tracker)
    @csv_file = csv_file
    @stat_tracker = stat_tracker
  end
end
