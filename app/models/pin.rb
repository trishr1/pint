class Pin < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>"}

	validates :image, presence: true
	validates :description, presence: true

	#validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]	not sure??
#do_not_validate_attachment_file_type :image, validate_media_type: false
end
