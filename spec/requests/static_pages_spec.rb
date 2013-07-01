require 'spec_helper'

describe "StaticPages" do

	let(:base_title) { "UploadDoc" }
	subject { page }

	describe "Home page" do
		before { visit root_path }

		# Nedan följer två enkla test som garanterar att 
		# inget fel sker med ex. routes och att dessa verkligen leder till framsidan.
		it { should have_selector('title', 	text: full_title('')) }


	end

	# LÄGG TILL TEST FÖR LÄNKAR OCH BYT LÄNKAR TILL NÅGOT MER PASSANDE.
	
	#it "should have the right links in header and footer" do
	#	visit root_path
	#	click_link "Home"
	#	click_link "About"
	#end
end
