class User < ApplicationRecord
    has_many :messages
    validates :name, uniqueness: true, presence: true, length: {minimum: 5, maximum: 50}
    has_secure_password
end
