FactoryGirl.define do
  factory :goal do
    title "My Goal"
	description "My Goal"
	category :body
	frequency :daily
	count 1
	icon "carrot"
	start_at 2.days.from_now
	end_at 10.days.from_now
	challengers_attributes [{ email: 'friend1@example.org', name: 'First' }, { email: 'test@test.com', name: 'Second' }, { email: 'friend3@example.org', name: 'Paddy' }]
  end
end
