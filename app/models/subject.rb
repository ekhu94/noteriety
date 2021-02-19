class Subject < ApplicationRecord
    has_many :notes
    has_many :users, through: :notes

    validates :name, presence: true

    def self.sort_alphabetically
        self.order(name: :asc)
    end
end