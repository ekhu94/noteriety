class Note < ApplicationRecord
    belongs_to :user
    belongs_to :subject
    has_many :bullet_points, dependent: :destroy
    accepts_nested_attributes_for :bullet_points
    has_one :summary, dependent: :destroy

    validates :topic, :content, presence: true, uniqueness: true
    validates :bullet_points, presence: true, length: { minimum: 1, maximum: 3, 
                                                        too_long: "cannot exceed 3 at a time" }
    validates_presence_of :summary_note, message: "must be included at the end"
    validates_presence_of :subject_name, message: "must belong to a subject"

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