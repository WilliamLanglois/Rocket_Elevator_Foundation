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
      context 'validation tests for creating a new Lead' do
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

# ------------------------------------------ CREATING A NEW QUOTE --------------------------------------------------------

# Since there is no require column for the lead they should all be true even if the quote is not complete

    describe "QUOTE" do
      context 'validation tests for creating a new Quote' do
        it 'test the firstName param' do
            quote = Quote.new(firstName: 'William Langlois').save
            expect(quote).to eq(true)
        end 
      
        it 'test the phoneNumber param' do
          quote = Quote.new(phoneNumber: '418-123-4567').save
            expect(quote).to eq(true)
        end 

        it 'test the email param' do
          quote = Quote.new(email: 'test@hotmail.com').save
            expect(quote).to eq(true)
        end 
      
        it 'test the email param' do
          quote = Quote.new(firstName: 'William Langlois', phoneNumber: '418-123-4567',
              companyName: 'Coder en pyjama inc', email: 'test@hotmail.com').save
            expect(quote).to eq(true)
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
# ------------------------------------------ CREATING A NEW LEAD --------------------------------------------------------

# As for this test, i commented the zendesk part in the controller since my token was expired... 

RSpec.describe PagesController, :type => :controller do
  context "creating a lead" do
    it "Controller test for Lead" do
      params  =  {
          :full_name=> "Uno Testo",
          :business_name=> "The testeur cie",
          :email=> "test@hotmail.com",
          :phone=> "123-456-7890",
          :project_name=> "Project",
          :project_description=> "Big projoect",
          :department=> "Residential",
          :message=> "this is a test",
          :file_attachment=> "attachment",
          :file_name=> "this is the name",
          }
          post(:create, params: params)
          expect(response.code).to eq "302"
      end
    end
end