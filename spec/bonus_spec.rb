require 'rails_helper'


# This is the bonus for this week

# ------------------------------------------ ENTERING AS A USER --------------------------------------------------------

    # RSpec.describe "AdminPanel", :type => :feature do
    #   context "we want to connect to a user account" do
    #       it "try to go to the log in page" do
    #           visit 'users/sign_in'
    #       end
    #   end
    # end

    # RSpec.describe "AdminPanel", :type => :feature do
    #     context "we want to connect to a user account" do
    #         it "use the info i give and connect to the account" do
    #             visit 'users/sign_in'
    #             fill_in "Email", with: 'will_langlois@hotmail.com'
    #             fill_in "Password", with: 'william'
    #         end
    #     end
    # end
# ------------------------------------------ USING THE SUBMISSION DEF IN QUOTE CONTROLLER --------------------------------------------------------

# It supose to return a reponse 200 wich is a PASS reponse

    RSpec.describe QuotesController, :type => :controller do
        describe "GET submission in the quote controller" do
          it "has a 200 status code" do
            get :submission
            expect(response.status).to eq(200)
          end
        end
      end
# ------------------------------------------ USING THE INDEX DEF IN PAGE CONTROLLER --------------------------------------------------------

# It supose to return a reponse 200 wich is a PASS reponse

      RSpec.describe PagesController, :type => :controller do
        describe "GET index in the page controller" do
          it "has a 200 status code" do
            get :index
            expect(response.status).to eq(200)
          end
        end
      end
# ------------------------------------------ CREATING A NEW LEAD --------------------------------------------------------

# Since there is no require column for the lead they should all be true even if the lead is not complete
    describe "LEAD" do
      context 'validation tests for creatin a new Lead' do
        it 'test the full_name param' do
            lead = Lead.new(full_name: 'William Langlois').save
            expect(lead).to eq(true)
        end 
      
        it 'test the business_name param' do
            lead = Lead.new(full_name: 'William Langlois', business_name: 'Coder en pyjama inc').save
            expect(lead).to eq(true)
        end 
      
        it 'test the email param' do
            lead = Lead.new(full_name: 'William Langlois', business_name: 'Coder en pyjama inc', email: 'ceciestuntest@hotmail.com').save
            expect(lead).to eq(true)
        end 
      end
    end

# ------------------------------------------ CREATING A NEW USER --------------------------------------------------------

# Since there is some require column for the user they should all be false except when the lastName, firstName, email and password is filled
  describe "USER" do
    context 'validation tests for creating a new User' do
      it 'ensures first name presence' do
        user = User.new(lastName: 'Langlois', email: 'untest@example.com').save
        expect(user).to eq(false)
      end
      it 'ensures last name presence' do
        user = User.new(firstName: 'William', email: 'untest@example.com').save
        expect(user).to eq(false)
      end
      
      it 'ensures email presence' do
        user = User.new(firstName: 'William', lastName: 'Langlois').save
        expect(user).to eq(false)
      end
      
      it 'ensure first and last name and email' do 
        user = User.new(firstName: 'William', lastName: 'Langlois', email: 'untest@example.com').save
        expect(user).to eq(false)
      end

      it 'ensure first and last name, email and password (it should be successful...)' do 
        user = User.new(firstName: 'William', lastName: 'Langlois', email: 'untest@example.com', password: 'Testing1!').save
        expect(user).to eq(true)
      end
    end
  end