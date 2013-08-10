require 'spec_helper'

describe Brewery::Priming do
  let(:priming) { described_class.new(radius: 8.5, height: 11.5) }

  describe "#volume_of_cylinder" do
    it { priming.volume_of_cylinder.should eql(2.609) }
  end

  describe "#total" do
    it "should return total of sugar and water" do
      sugar, water = priming.total(sugar: 6)

      sugar.should eql(15.654)
      water.should eql(46.962)
    end
  end
end
