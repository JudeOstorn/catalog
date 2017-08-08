class Position < ApplicationRecord
  has_many :worker
  validates :title, uniqueness: true, presence: true, length: { minimum: 5, maximum: 50 }
end
