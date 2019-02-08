class Course < ApplicationRecord
  has_many :holes
  accepts_nested_attributes_for :holes

  validates :name, presence: true, uniqueness: true

  def to_s
    {
      name: name,
      holes: holes.map(&:to_s)
    }
  end
end
