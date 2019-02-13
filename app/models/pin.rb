class Pin < ApplicationRecord
  belongs_to :hole

  validates :label, presence: true, uniqueness: { scope: :hole }
  validates :par, presence: true, numericality: {
    integer_only: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 6
  }
  validates_associated :hole
end
