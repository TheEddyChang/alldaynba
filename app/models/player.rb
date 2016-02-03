class Player < ActiveRecord::Base
  belongs_to :team, :class_name => "Team", :foreign_key => "TEAM_ID", :primary_key => "nba_id"

end
