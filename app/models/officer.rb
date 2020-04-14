class Officer < ApplicationRecord
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
		validates :name,	presence: true,
											uniqueness: true


		validates :email, presence: true,
											uniqueness: true,
											format: { with: EMAIL_REGEX }
end
