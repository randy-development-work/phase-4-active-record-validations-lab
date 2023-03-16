class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }


    # validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    # validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validates :category, inclusion: ['Fiction', 'Non-Fiction']

    validate :sufficient_clickbait_y

    def sufficient_clickbait_y
        unless title.present? && title.match?(/(Secret)|(Won't Believe)|(Top \d)|(Guess)/i)
            errors.add(:title, "Only clickbait-y Titles Allowed!")
        end
    end
end
