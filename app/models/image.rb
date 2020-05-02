class Image < ApplicationRecord
    has_one_attached :image

    validates :title, presence: true
    validate :correct_image_type

    private

    def correct_image_type
        if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
            errors.add(:image, 'must be jpg or png')
        elsif image.attached? == false
            errors.add(:image, 'image required')
        end
    end

end
