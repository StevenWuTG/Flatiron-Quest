class Quest < ActiveRecord::Base
    has_many :battles
    has_many :users, through: :battles
    has_many :monsters, through: :battles
    has_many :supports, through: :battles

end