class Ingredient < ActiveRecord::Base
    belongs_to :recipe
    validates :name, :measurement, :amount, presence: true
end