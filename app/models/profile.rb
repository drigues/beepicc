class Profile < ApplicationRecord
  belongs_to :user

  validates :directory, presence: true, uniqueness: true

  def to_param
    directory
  end
end
