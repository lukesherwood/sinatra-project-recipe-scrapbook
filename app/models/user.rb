class USER < ActiveRecord::Base
    has_many :RECIPES

    has_secure_password

    validates :username, :presence => true, 
                       :uniqueness => true
    validates :email,    :presence => true,
                       :uniqueness => true,
                       :format => {:with => /\w+@\w+\.\w+/}
    validates :password, :presence => true
end
