require 'spec_helper'

describe Brewery::Refractometer do
  context "Brix to Specific Gravity" do
    let(:tool) { Brewery::Refractometer.new(original_brix: 17) }

    describe "#specific_gravity" do
      it "should return the specific gravity of the original brix" do
        tool.specific_gravity.should eql(1.0706483000102098)
      end
    end
  end

  context "Corrected Final Gravity & ABV% by Brix" do
    let(:tool) { Brewery::Refractometer.new(original_brix: 17, final_brix: 7.5) }

    describe "#final_gravity" do
      it { tool.final_gravity.should eql(1.0049822062500002) }
    end

    describe "#index_of_refraction" do
      it { tool.index_of_refraction.should eql(1.34404970008125) }
    end

    describe "#alcohol_by_weight" do
      it { tool.alcohol_by_weight.should eql(6.734352775327011) }
    end

    describe "#alcohol_by_volume" do
      it { tool.alcohol_by_volume.should eql(8.523809458203969) }
    end
  end
end
