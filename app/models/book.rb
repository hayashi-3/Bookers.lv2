class Book < ApplicationRecord

	belongs_to  :user

	before_action :correct_user, only: [:edit, :update]

	validates :title, presence: true
	validates :body, presence: true, length: { maximum: 200 }

end
