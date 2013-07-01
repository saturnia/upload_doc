require 'spec_helper'

describe "UserPages" do

	subject { page }

	describe "profile pagefor role = user" do
		let(:user) { FactoryGirl.create(:user) }
		before { sign_in user }
		before { visit dashboard_index_path(user) }

		it { should have_selector('h2', text: user.name) }
		it { should have_selector('title', 	text: "UploadDoc") }
		#it { should_not have_selector('h1', text: "All users") }
	end

	describe "profile page for role = 'admin'" do
		let(:user) { FactoryGirl.create(:user) }
		before { sign_in user }
		before { visit dashboard_index_path(user) }

		it { should have_selector('h2', text: user.name) }
		it { should have_selector('title', text: "UploadDoc") }
		it { should have_selector('caption', text: "All Users") }
		it { should have_link('Create new user', href: users_create_path) }
	end


 	describe "sign_up" do
 		let(:user) { FactoryGirl.create(:user) }
 		before { sign_in user }
		before { visit users_create_path }

		let(:submit) { "Create User" }

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

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before { sign_in user }
		before { visit edit_user_registration_path(user) }

		describe "page" do
			it { should have_selector('h2', text: "Edit User") }
			it { should have_selector('h3', text: "Cancel my account") }
		end

		describe "with invalid information" do
			before { click_button "Update" }

			it { should have_content('error') }
		end

		describe "with valid information" do
			let(:new_name) 	{ "New Name" }
			let(:new_email) { "new@example.com" }
			before do
				fill_in "Name", 					with: new_name
				fill_in "Email", 					with: new_email
				fill_in "Password", 				with: user.password
				fill_in "Password confirmation",	with: user.password
				fill_in "Current password",			with: user.password
				click_button "Update"
			end

			it { should have_selector('h2', text: new_name) }	
			it { should have_link('Sign out', href: destroy_user_session_path) }

			specify { user.reload.name.should  == new_name }
      		specify { user.reload.email.should == new_email }
      	end


	end
end

