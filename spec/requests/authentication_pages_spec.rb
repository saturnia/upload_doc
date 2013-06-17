require 'spec_helper'

describe "Authentication" do
	
	subject { page }

	describe "sign in" do
		before { visit new_user_session_path }

		it { should have_selector('h2', text: 'Sign in') }

		describe "with invalid information" do
			before { click_button "Sign in" }

			it { should have_selector('h2', text: 'Sign in') }
			it { should have_selector('div#flash_alert', text: 'Invalid email or password.')}
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email",	with: user.email.upcase
				fill_in "Password", with: user.password
				click_button "Sign in"
			end

			it { should have_selector('h2', text: "Martin Gyhagen") }
			it { should have_link('Sign out', href: destroy_user_session_path) }
			it { should_not have_link('Sign in', href: new_user_session_path) }
		end
	end	
end