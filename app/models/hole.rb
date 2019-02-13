class Hole < ApplicationRecord
  belongs_to :course
  has_many :pins, dependent: :destroy
  accepts_nested_attributes_for :pins

  validates :position, numericality: { integer_only: true, greater_than: 0 }, uniqueness: { scope: :course }

  def to_s
    "Hole #{label ? label : position}"
  end
end
