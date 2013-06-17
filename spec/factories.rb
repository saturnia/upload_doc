FactoryGirl.define do
	
	factory :user do
		name		"Martin Gyhagen"
		email		"martin.gyhagen@gmail.com"
		password 	"foobar"
		password_confirmation "foobar"

		factory :admin do
			admin true
		end
	end

	factory :attachment do
		item File.new(Rails.root + 'rails.png')
	end
	
end