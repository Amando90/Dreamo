class Post < ActiveRecord::Base
  	belongs_to :user

  	has_attached_file :image, styles: { large: "640x640>", medium: "320x320>", small: "160x160>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
