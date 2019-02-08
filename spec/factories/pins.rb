FactoryBot.define do
  factory :pin do
    label { 'A' }
    distance_value { rand(240..420) }
    distance_unit { 'feet' }
    hole {}
  end
end
