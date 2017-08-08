class Position < ApplicationRecord
  has_many :worker
  validates :title, uniqueness: true, presence: true, length: { minimum: 3, maximum: 50 }
end
