class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

	has_many :projects, dependent: :destroy



	def self.from_omniauth(access_token)
	    data = access_token.info
	    user = User.where(email: data['email']).first
	    user
	end
end
