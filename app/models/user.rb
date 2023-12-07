class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(omniauth)
    return nil unless omniauth[:email] =~ /@bacancy.com\z/
    create_with(uid: omniauth[:uid], first_name: omniauth[:first_name], provider: 'google').find_by(email: omniauth[:email])
  end
end
