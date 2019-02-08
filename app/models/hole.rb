class Hole < ApplicationRecord
  belongs_to :course
  has_many :pins
  accepts_nested_attributes_for :pins

  validates :position, numericality: { integer_only: true, greater_than: 0 }, uniqueness: { scope: :course }

  def to_s
    out = "hole #{position}"
    out += ":#{label}" if label
    out += ' ' + pins.map(&:to_s).join(' | ') unless pins.empty?
    out
  end
  alias inspect to_s
end
