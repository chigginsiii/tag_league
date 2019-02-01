require 'rails_helper'

RSpec.describe PlayerEvent, type: :model do
  it { is_expected.to belong_to :series_event }
  it { is_expected.to belong_to :player }
end
