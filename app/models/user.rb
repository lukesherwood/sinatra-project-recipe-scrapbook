class USER < ActiveRecord::Base
    has_many :RECIPES
    has_secure_password
    validates :username, :email, :password, presence: true
end
