class Course < ApplicationRecord
	validates :name, uniqueness: true, :presence => true
	has_and_belongs_to_many :users
	mount_uploader :image, ImageUploader
	#attr_accessible :image
end
