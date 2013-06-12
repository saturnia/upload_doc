require 'spec_helper'

describe "StaticPages" do

	describe "Home page" do

		# Nedan följer en rad självklara test
		it "should have the h1 'Home'" do
			visit '/static_pages/home'
			page.should have_selector('h1', text: 'Home')
		end

		it "should have the title 'Home'" do
			visit '/static_pages/home'
			page.should have_selector('title', text: 'UploadDoc | Home')
		end


	end
end
