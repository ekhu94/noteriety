class Note < ApplicationRecord
    belongs_to :user
    belongs_to :subject
    has_many :bullet_points, dependent: :destroy
    has_one :summary, dependent: :destroy

    validates :topic, :content, presence: true
    validates :bullet_points, length: { minimum: 1, too_short: "At least 1 bullet point is required",
                                        maximum: 3, too_long: "3 bullet points is the maximum permitted" }
    validates_presence_of :summary_note, message: "must be included at the end"

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