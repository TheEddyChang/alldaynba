class Team < ActiveRecord::Base
  
  has_many :players, :primary_key => "nba_id"


end
