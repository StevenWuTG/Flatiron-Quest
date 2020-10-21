class Quest < ActiveRecord::Base
    has_many :battles
    has_many :users, through: :battles
    has_many :monsters, through: :battles
end