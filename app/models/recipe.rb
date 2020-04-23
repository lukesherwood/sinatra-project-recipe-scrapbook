class Recipe < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    has_many :ingredients
    validates :name, :method, presence: true #ingredients_id?
end
