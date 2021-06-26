class User < ApplicationRecord
  acts_as_favoritor
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :styles, dependent: :destroy
  has_many :blogs

  def full_name
    "#{first_name} #{last_name}"
  end

  validates_presence_of :username, :email
  validates_uniqueness_of :email, :username
end
