require_relative '../lib/icons.rb'

describe Icons do


    describe ".display_icons" do
        context "given an array of three tens" do
            it "returns an array of three black squares" do
                expect(Icons.display_icons([10,10,10])).to eq([Icons.square_icon,Icons.square_icon,Icons.square_icon])
            end
        end
        context "given an array with two scores that sums 10" do
            it "returns the first score normally and the second as a triangle" do
                expect(Icons.display_icons([0,10])).to eq([0,Icons.triangle_icon])
            end
        end
        context "given an array with two scores that doesnt sum 10" do
            it "returns both scores as numbers" do
                expect(Icons.display_icons([4,5])).to eq([4,5])
            end
        end
        context "given an array with three scores that the first two sum 10 and the remaining is 10" do
            it "returns first score normally, the second as a triangle and the last as a square" do
                expect(Icons.display_icons([5,5,10])).to eq([5,Icons.triangle_icon,Icons.square_icon])
            end
        end
        context "given an array with three scores that the first is 10 and the remaining two sums 10" do
            it "returns the first score as a black square, the second normally and the last as a triangle" do
                expect(Icons.display_icons([10,7,3])).to eq([Icons.square_icon,7,Icons.triangle_icon])
            end
        end
        context "given an array with the first score being 10" do
            it "returns the first as a blank space and the second as a black square" do
                expect(Icons.display_icons([10,0])).to eq([" ",Icons.square_icon])
            end
        end
        context "given an array with three scores that the first is 10 and the remaining two doesnt sums 10" do
            it "returns the first score as a black square, the second normally and the last as a triangle" do
                expect(Icons.display_icons([10,4,2])).to eq([Icons.square_icon,4,2])
            end
        end
    end
end