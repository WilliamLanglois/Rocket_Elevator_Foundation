require 'elevator_media'


describe Streamer do

    describe "get content" do
# ------------------------------------------ GET CONTENT --------------------------------------------------------
        # context "doing the get content thing" do
        #     it "doing it first test that it's not supose to be nil" do
        #         expect(Streamer.getcontent()).to_not eq(nil)
        #     end
        # end
        context "doing the get content thing" do
            it "getting content... that is supose to be a string" do
                expect(Streamer.getcontent()).to be_a(String)
            end
        end
# ------------------------------------------ GET IMAGE FROM INTERNET APP --------------------------------------------------------
        # context "doing the get content thing plus something more" do
        #     it "getting content plus something more..." do
        #         expect(Streamer.realcontent()).to eq("app/assets/images/rocket.png")
        #     end
        # end
# ------------------------------------------ GET IMAGE FROM INTERNET 1 -------------------------------------------------------- 
        # context "taking something from the internet" do
        #     it "getting content plus something much more interesting..." do
        #         expect(Streamer.muchocontent()).to eq(41611)
        #     end
        # end
# ------------------------------------------ GET IMAGE FROM INTERNET 2 --------------------------------------------------------
        # context "taking something from the internet" do
        #     it "getting an elevator image" do
        #         expect(Streamer.elevatorcontent()).to eq(102112)
        #     end
        # end
# ------------------------------------------ TEMPERATURE --------------------------------------------------------
        # context "temperature giver" do
        #     it "supose to give the temperature package" do
        #         expect(Streamer.temperature()).to_not eq(nil)
        #     end
        
        #     it "supose to give the temperature with a string" do
        #         expect(Streamer.temperature()).to be_a(String)
        #     end
        # end
# ------------------------------------------ FUN FACT (RANDOM CITY) --------------------------------------------------------
        describe "getting city from random building" do
            it "getting something from database... in a package form" do
                expect(Streamer.gettingRandomCityFromMYSQL()).to_not eq(nil)
            end
        
            it "getting something from database... in a string" do
                expect(Streamer.gettingRandomCityFromMYSQL()).to be_a(String)
            end
        end
# ------------------------------------------ GEM PG CONNECT --------------------------------------------------------
        describe "connection au gem pg" do
            it "test if we can connect to the postgres db" do
                expect(Streamer.gettingBusinessNameFromPG()).to_not eq(nil)
            end
        
            it "test if we can go inside the db" do
                expect(Streamer.gettingBusinessNameFromPG()).to_not eq(nil)
            end
        
            it "test if we can go fetch data from the table" do
                expect(Streamer.gettingBusinessNameFromPG()).to be_a(String)
            end
        end
# ------------------------------------------ FUN FACT (COUNT OF CUTSOMER) --------------------------------------------------------
        describe "fun fact about us" do
            it "test if we can connect to mysql db" do
                expect(Streamer.gettingFunFact()).to_not eq(nil)
            end
        
            it "test if we can go inside a table" do
                expect(Streamer.gettingFunFact()).to_not eq(nil)
            end
        
            it "test if we can fetch data from a table" do
                expect(Streamer.gettingFunFact()).to_not eq(nil)
            end
        
            it "test if we can fetch data from a table as a string" do
                expect(Streamer.gettingFunFact()).to be_a(String)
            end
        end
# ------------------------------------------ GETTING SUPERHERO --------------------------------------------------------
        describe "Getting superhero name" do
            it "supose to give you the superhero name" do
                expect(Streamer.getsuperhero()).to be_a(String)
            end
        end

# ------------------------------------------ TEST OF CONTROLLER --------------------------------------------------------
        # describe "page controller" do
        #     it "test if page controller work" do
        #         expect(PagesController.create()).to_not eq(nil)
        #     end
        # end        





    end
end


