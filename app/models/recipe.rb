class RECIPE < ActiveRecord::Base
    belongs_to :USER
    validates :name, :ingredients, :method, presence: true
end
