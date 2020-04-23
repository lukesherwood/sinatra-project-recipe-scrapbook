class User < ActiveRecord::Base
    has_many :recipes
    has_secure_password

    validates :username, :presence => true, 
                       :uniqueness => true
    validates :email,    :presence => true,
                       :uniqueness => true,
                       :format => {:with => /\w+@\w+\.\w+/}
end
