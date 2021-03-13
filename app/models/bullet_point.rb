class BulletPoint < ApplicationRecord
    belongs_to :note
    # validates :note, presence: true
end