FactoryBot.define do
  factory :pin do
    label { 'A' }
    distance_value { rand(240..420) }
    distance_unit { 'feet' }
    par { 3 }
    hole {}
  end
end
