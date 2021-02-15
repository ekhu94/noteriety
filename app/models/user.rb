class User < ApplicationRecord
    has_many :notes
    has_many :subjects, through: :notes
    has_secure_password

    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true, uniqueness: true
end