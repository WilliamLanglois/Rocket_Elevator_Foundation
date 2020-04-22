require 'elevator_media'


describe Streamer do

    describe "get content" do
        context "doing the get content thing" do
            it "getting content..." do
                expect(Streamer.getcontent()).to eq(nil)
            end
        end
        context "doing the get content thing plus something more" do
            it "getting content plus something more..." do
                expect(Streamer.realcontent()).to eq("app/assets/images/rocket.png")
            end
        end
        context "taking something from the internet" do
            it "getting content plus something much more interesting..." do
                expect(Streamer.muchocontent()).to eq(41611)
            end
        end
        context "taking something from the internet" do
            it "getting an elevator image" do
                expect(Streamer.elevatorcontent()).to eq(102112)
            end
        end
        context "temperature shit" do
            it "supose to give the temperature" do
                expect(Streamer.temperature()).to_not eq(nil)
            end
        end
    end
end

describe Bonus do
    describe "getting something" do
        it "getting something from database..." do
            expect(Bonus.gettingSomething()).to_not eq(nil)
        end
    end
end

