require 'spec_helper'

describe Brewery::Priming do
  let(:priming) { Brewery::Priming.new(radius: 8.5, height: 11.5) }

  context "#total_liquid" do
    it "should return the total liquid" do
      priming.total_liquid.should eql(2.609)
    end
  end
end
