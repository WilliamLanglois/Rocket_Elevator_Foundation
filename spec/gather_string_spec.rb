require 'gather_string'

describe GatherString do
    describe ".add" do
        context "test for an empty string" do
            it "return 4" do
                expect(GatherString.add("1234")).to eq("1234")
            end
        end
        context "a grand coup de 2" do
            it "rajoute 2 pi la le input est 2..." do
                expect(GatherString.add("2")).to eq("2")
            end
        end
    end
end

