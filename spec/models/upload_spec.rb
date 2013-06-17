require 'spec_helper'

describe Upload do

	let(:user) { FactoryGirl.create(:user) }
	
	describe "accessible attributes" do
		it "should not allow access to user_id" do
			expect do
				Document.new(user_id: user.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end

	describe "attachment" do
		before do
			Attachment.any_instance.stub(:save_attached_files).and_return
			let(:attachment) { FactoryGirl.create(:attachment) }
		end
		describe "#your_method" do
			it "returns the correct results" do
				:attachment == :correct_result 
			end
		end

	end

end
