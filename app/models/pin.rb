class Pin < ApplicationRecord
  belongs_to :hole

  validates :label, presence: true, uniqueness: { scope: :hole }
  validates_associated :hole

  def to_s
    out = label.to_s
    out += ":#{distance_value}#{distance_unit&.to_s}" if distance_value
    out
  end
  alias inspect to_s
end
