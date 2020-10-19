class Battle < ActiveRecord::Base
    belongs_to :user
    belongs_to :quest
    belongs_to :monster
    belongs_to :support
    

end