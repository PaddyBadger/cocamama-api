FactoryGirl.define do
  factory :goal do
    title "My Goal"
	description "My Goal"
	published false
	category 1
	frequency 1
	count 10
 	user
  end
end
