class User < ApplicationRecord
    has_many :notes
    has_many :subjects, through: :notes
end