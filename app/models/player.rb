class Player < ActiveRecord::Base
  belongs_to :team, :foreign_key => "TeamID"
end
