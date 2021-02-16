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

    def bullet_point_contents=(contents)
        contents.each do |c|
            if c.strip != ""
                self.bullet_points.build(keywords: c)
            end
        end
    end

    def bullet_point_contents
        self.bullet_points.map { |bp| bp.keywords }
    end

    def summary_note=(summary)
        self.summary = Summary.find_or_create_by(content: summary)
    end

    def summary_note
        self.summary ? self.summary.content : nil
    end
end