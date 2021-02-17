class Note < ApplicationRecord
    belongs_to :user
    belongs_to :subject
    has_many :bullet_points, dependent: :destroy
    accepts_nested_attributes_for :bullet_points
    has_one :summary, dependent: :destroy

    validates :topic, :content, :subject, presence: true
    validates :bullet_points, presence: true, length: { minimum: 1, too_short: "At least 1 bullet point is required",
                                        maximum: 3, too_long: "3 bullet points is the maximum permitted" }
    validates_presence_of :summary_note, message: "must be included at the end"

    def self.search(query)
        if query.present?
            self.where('lower(topic) LIKE ?', "%#{query.downcase}%")
        else
            self.all
        end
    end

    def self.sort_by_date
        self.order(created_at: :desc)
    end

    def subject_name=(name)
        self.subject = Subject.find_or_create_by(name: name)
    end

    def subject_name
        self.subject ? self.subject.name : nil
    end

    def bullet_points_attributes=(attributes)
        attributes.values.each do |c|
            bullet_point = BulletPoint.find_or_create_by(c)
            self.bullet_points << bullet_point if !self.bullet_points.find_by(id: bullet_point.id) && bullet_point.keywords.present?
        end
    end

    def bullet_points_attributes
        self.bullet_points.map { |bp| bp.keywords }
    end

    def summary_note=(summary)
        self.summary = Summary.find_or_create_by(content: summary)
    end

    def summary_note
        self.summary ? self.summary.content : nil
    end
end