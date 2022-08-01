class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 2 }
    before_save { email.downcase! }

    def self.find_by_username(username)
        user = User.find_by(username: username)
        return user
    end

    def user_details
        return {
            id: self.id,
            username: self.username,
            created_at: self.created_at
          }
    end
end
