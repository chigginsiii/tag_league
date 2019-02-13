require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'has a name' do
    course = create(:course, name: 'The Majestical')
    expect(course.name).to eq 'The Majestical'
  end

  it 'has holes' do
    course = create(:course, :with_18_holes)
    expect(course.holes.length).to eq 18
  end

  describe 'course hole' do
    it 'has a unique position' do
      course = create(:course)
      course.holes.create!(position: 1)
      expect(course.holes.length).to eq 1
      expect(course.holes.first.position).to eq 1

      course.holes.build(position: 1)
      expect(course).not_to be_valid
    end

    it 'has a label' do
      course = create(:course)
      hole = create(:hole, label: '1x', course: course)
      expect(hole.label).to eq '1x'
    end

    it 'has one or more pins' do
      course = create(:course)
      hole = create(:hole, :with_pin, course: course)
      expect(hole.pins.length).to eq 1

      hole.pins.create(label: 'B', distance_value: '300', distance_unit: 'feet')
    end
  end

  describe 'pins' do
    it 'has a unique label' do
      course = create(:course)
      hole = create(:hole, course: course)
      pin = create(:pin, hole: hole, label: 'A')
      expect(pin.label).to eq 'A'

      pin_too = build(:pin, hole: hole, label: 'A')
      expect(pin_too).to be_invalid
    end

    it 'may have a distance' do
      course = create(:course)
      hole = create(:hole, course: course)
      pin = create(:pin, hole: hole, label: 'A', distance_value: 444, distance_unit: 'feet')

      expect(pin.distance_value).to be.positive?
    end
  end
end
