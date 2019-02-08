FactoryBot.define do
  factory :course do
    name { 'Test Course' }

    trait :with_18_holes do
      after :create do |course|
        (1..18).each do |num|
          create(:hole, position: num, course: course)
        end
        course.reload
      end
    end
  end
end
