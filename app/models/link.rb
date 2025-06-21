class Link < ApplicationRecord
  belongs_to :user

  scope :published, -> { where(visible: true) }

end
