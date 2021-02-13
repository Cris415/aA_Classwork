require "problem.rb"

describe Array do

  describe "#my_uniq" do
    it "should return empty array if array is empty" do
        expect([].my_uniq).to eq([])
    end

    it "should return same array if it has no duplicates" do
      expect([1,2,3].my_uniq).to eq([1,2,3])
    end

    it "should return unique array if array has duplicates" do
      expect([1,2,3,1].my_uniq).to eq([1,2,3])
      expect([1,2,3,3].my_uniq).to eq([1,2,3])
    end

    context "when given an array containing multiple data types" do
      it "should return unique array if array has duplicates" do
        expect(["a", 1, :hello, false, [], false, "a"].my_uniq).to eq(["a", 1, :hello, false, []])
      end
    end
  end

  describe "#two_sum" do

    context "if array contains non-numeric elements" do
      it "should raise an error" do
        expect { ["a", 7, true].two_sum }.to raise_error("Array should contain numeric elements only")
      end
    end

    context "if there are no sums" do
      it "should return an empty array" do
        expect([].two_sum).to eq([])
        expect([3,5,7,3,4].two_sum).to eq([])
      end
    end

    context "if there are sums" do
      it "should return the pairs where the elements at those positions sum to zero" do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        expect([5,3,-5,0].two_sum).to eq([[0,2]])
      end
    end

  end

  describe "#my_transpose" do
    it "should take in a two dimensional array" do
      expect{[1,2,3].my_transpose}.to raise_error("Array should be two-dimensional")
    end

    it "transposes matrix" do
      m1 = [["a", "b"],["c", "d"]]
      m2 = [[8, 4, 3],[4, 3, 3], [6, 4, 10]]
      expect(m1.my_transpose).to eq([["a","c"],["b", "d"]])
      expect(m2.my_transpose).to eq([[8,4,6], [4,3, 4], [3,3,10]])
    end

    context "if array is empty" do
      it "should return the empty array" do
        expect([].my_transpose).to eq([])
      end
    end


    context "if matrix is not square" do
      it "raises an error" do
        expect{[[1],[2,3]].my_transpose}.to raise_error("Matrix must be square")
      end
    end

  end

end

describe TowersGame do
  subject(:game) { TowersGame.new(5) }

  describe "#move" do
    it "should accept an integer representing a valid disk size" do
      expect { game.move("7", 2) }.to raise_error("Disk size must be an integer")
      expect { game.move(7, 2) }.to raise_error("Disk size must be an integer")
    end

    context "if the disk is not on top of one of the piles" do
      it "should give an error"
      
    end
    it "should accept an integer representing which pile to move the disk to"
    
    it "should move the given disk to the given pile"
  end

end