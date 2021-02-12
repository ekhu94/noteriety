class Note < ApplicationRecord
    belongs_to :user
    belongs_to :subject
    has_many :bullet_points, dependent: :destroy
    has_one :summary, dependent: :destroy
end