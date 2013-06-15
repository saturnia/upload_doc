FactoryGirl.define do
	
	factory :user do
		name		"Martin Gyhagen"
		email		"martin.gyhagen@gmail.com"
		password 	"foobar"
		password_confirmation "foobar"
	end
end