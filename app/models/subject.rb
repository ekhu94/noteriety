class Subject < ApplicationRecord
    has_many :notes
    has_many :users, through: :notes

    validates :name, presence: true
end