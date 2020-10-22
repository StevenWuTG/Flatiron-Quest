class Quest < ActiveRecord::Base
    
    has_many :monsters
    has_many :battles , through: :monsters
end