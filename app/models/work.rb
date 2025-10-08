class Work < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :memo, presence: true, length: { maximum: 65_535 }

  belongs_to :user

  enum :status, { incomplete: 0, complete: 1 }
end
