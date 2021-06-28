class User < ApplicationRecord
  acts_as_favoritor
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :validatable
         # :omniauthable, omniauth_providers: %i[twitter facebook google_oauth2]

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     user.first_name = auth.info.first_name   # assuming the user model has a name
  #     user.last_name = auth.info.last_name
  #     # If you are using confirmable and the provider(s) you use validate emails,
  #     # uncomment the line below to skip the confirmation emails.
  #     # user.skip_confirmation!
  #   end
  # end

  has_many :styles, dependent: :destroy
  has_many :blogs

  def full_name
    "#{first_name} #{last_name}"
  end

  validates_presence_of :username, :email
  validates_uniqueness_of :email, :username
end
