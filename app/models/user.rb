class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :products
	has_many :designs
	
	# has_secure_password
	
	# validates :firstname, presence: true
	# validates :lastname, presence: true

	# validates :email,
	# 	uniqueness: { case_sensitive: true },
	# 	format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	# validates :password,
	# 	presence: true,
	# 	length: {minimum: 5},
	# on: :create

	has_attached_file :avatar, 
	:styles => { 
		:medium => "x600>", 
		:thumb => "100x100>" 
		}, 
		:default_url => "/assets/missing.png"
		validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	end
