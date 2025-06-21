# /Users/thiagorodrigues/thgo/beepicc/app/models/user.rb

class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_one :profile, dependent: :destroy
  has_many :links, dependent: :destroy

  # Avatar attachment
  has_one_attached :avatar

  # Callback to auto-create profile
  after_create :create_profile

  private

  def create_profile
    build_profile(
      name: self.name.presence || email.split('@').first,
      directory: generate_unique_directory
    ).save
  end

  def generate_unique_directory
    base = email.split('@').first.parameterize
    suffix = SecureRandom.hex(2)
    directory = "#{base}-#{suffix}"
    puts "DEBUG: Generated directory → #{directory}"
    directory
  end

end
