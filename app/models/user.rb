class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Devise modules...
  has_one :profile, dependent: :destroy
  has_many :links, dependent: :destroy

  has_one_attached :avatar

  after_create :create_profile

  def create_profile
    Profile.create(user: self, name: self.name)
  end
end
  