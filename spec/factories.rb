FactoryGirl.define do
	
	factory :user do
		name		"Example"
		email		"example@user.com"
		password 	"example"
		password_confirmation "example"
		role		"admin"

		factory :admin do
			admin true
		end
	end

	factory :bum, class: User do
		name		"Bum"
		email		"bum@bum.com"
		password 	"foobar"
		password_confirmation "foobar"
		role	"user"
	end

	factory :attachment do
		item File.new(Rails.root + 'rails.png')
	end	
end


