class Game < ActiveRecord::Base
  belongs_to :home_team, :class_name => "Team", :foreign_key => "home_teamID", :primary_key => "nba_id"
  belongs_to :visitor_team, :class_name => "Team", :foreign_key => "visit_teamID", :primary_key => "nba_id"
  scope :todays_games, -> {
    where(:date => DateTime.now.strftime("%Y%m%d"))
  }

    def calculate_probability!
      if 
       self.home_team.reb_per_game
       self.visitor_team.pts_per_game
     end
    end
  
end





