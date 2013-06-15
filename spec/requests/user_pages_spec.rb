require 'spec_helper'

describe "UserPages" do

	subject { page }

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit dashboard_index_path }

		it { should have_selector('h2', 	text: user.name) }
		it { should have_selector('title', 	text: "UploadDoc") }

	end

	describe "sign_up" do
		before { visit new_user_registration_path }

		let(:submit) { "Sign up" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", 		with: "Example User"
				fill_in "Email",		with: "user@example.com" 
				fill_in "Password", 	with: "foobar"
				fill_in "Password confirmation", with: "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end
	end
end

