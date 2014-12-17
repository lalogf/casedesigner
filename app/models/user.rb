class User < ActiveRecord::Base
	has_many :products
	has_many :designs


	has_attached_file :avatar, 
	:styles => { 
			:medium => "x600>", 
			:thumb => "100x100>" 
		}, 
	:default_url => "/assets/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
