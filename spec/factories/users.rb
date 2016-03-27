FactoryGirl.define do
	factory :user do
		email { FFaker::Internet.email }
		password '12345678'
		password_confirmation '12345678'
		name 'test name'

		trait :with_goals do
			goals { create_list(:goal, 1) }
		end
	end
end
