class Note < ApplicationRecord
    belongs_to :user
    belongs_to :subject
    has_many :bullet_points, dependent: :destroy
    has_one :summary, dependent: :destroy

    validates :summary, presence: true

    def subject_name=(name)
        self.subject = Subject.find_or_create_by(name: name)
    end

    def subject_name
        self.subject ? self.subject.name : nil
    end
end