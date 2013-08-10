require 'spec_helper'

describe Brewery::Priming do
  let(:priming) { described_class.new(radius: 8.5, height: 11.5) }

  describe "#volume_of_cylinder" do
    it { priming.volume_of_cylinder.should eql(2.609) }
  end

  describe "#total_of_sugar" do
    it { priming.total_of_sugar(gr: 6).should eql(15.654) }
  end
end
