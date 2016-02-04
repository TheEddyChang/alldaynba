class Game < ActiveRecord::Base
  belongs_to :home_team, :class_name => "Team", :foreign_key => "home_teamID", :primary_key => "nba_id"
  belongs_to :visitor_team, :class_name => "Team", :foreign_key => "visit_teamID", :primary_key => "nba_id"
  scope :todays_games, -> {
    where(:date => DateTime.now.strftime("%Y%m%d"))
  }

  def calculate_probability!

    home_reb = self.home_team.reb_per_game
    home_pts = self.home_team.pts_per_game
    home_ast = self.home_team.asst_per_game

    visit_reb = self.visitor_team.reb_per_game
    visit_pts = self.visitor_team.pts_per_game
    visit_ast = self.visitor_team.asst_per_game

    total_reb = home_reb + visit_reb
    total_pts = home_pts + visit_pts
    total_ast = home_ast + visit_ast

    home_stat = home_reb/(total_reb) * 0.3 + home_pts/(total_pts) * 0.4 + home_ast/(total_ast) * 0.3

    visit_stat = visit_reb/(total_reb) * 0.3 + visit_pts/(total_pts) * 0.4 + visit_ast/(total_ast) * 0.3

    self.home_probability = (home_stat * 100).round.to_f
    self.visitor_probability = (visit_stat * 100).round.to_f
   end

end
