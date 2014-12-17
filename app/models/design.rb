class Design < ActiveRecord::Base
	belongs_to :user


	has_attached_file :image, 
	:styles => { 
			:medium => "x600>", 
			:thumb => "100x100>" 
		}, 
	:default_url => "/assets/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
