class Image < ApplicationRecord
    has_one_attached :image
    validates :title, presence: true
    validates :image, presence: true
    validate :correct_image_type

    private

    def correct_image_type
        if image.attached? && !image.content_type.in?(%w(image/jpeg image.png))
            errors.add(:image, 'image must be jpeg or png')
        end
    end
end
