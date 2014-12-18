class Product < ActiveRecord::Base
	belongs_to :user


	has_attached_file :case_image, 
	:styles => { 
			:medium => "x600>", 
			:thumb => "200x200>" 
		}, 
	:default_url => "/assets/missing.png"
	validates_attachment_content_type :case_image, :content_type => /\Aimage\/.*\Z/
	
end
