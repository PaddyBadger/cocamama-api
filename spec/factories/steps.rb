FactoryGirl.define do
  factory :step do
    title "My Step"
	description "My Step"
	published false
	category 1
	frequency 1
	count 10
 	user
  end
end
