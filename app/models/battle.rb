class Battle < ActiveRecord::Base
    belongs_to :user
    belongs_to :monster
end