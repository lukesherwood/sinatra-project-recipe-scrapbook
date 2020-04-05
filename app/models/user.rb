class USER < ActiveRecord::Base
    has_many :RECIPES
    has_secure_password
end
