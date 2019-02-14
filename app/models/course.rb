class Course < ApplicationRecord
  has_many :holes, -> { order(:position) }, dependent: :destroy
  accepts_nested_attributes_for :holes
  has_many :event_rounds

  validates :name, presence: true, uniqueness: true

  def add_new_hole
    new_position = holes.maximum(:position).to_i + 1
    holes.create!(
      position: new_position,
      label: new_position.to_s,
      pins_attributes: [
        { label: "A", distance_value: 250, distance_unit: "ft", par: 3 }
      ]
    )
  end

  def remove_hole(position:)
    holes.find_by(position: position).destroy!
    holes.reload
    holes.each_with_index do |hole, i|
      hole.position = i + 1
      hole.save!
    end
  end
end
