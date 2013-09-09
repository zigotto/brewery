require 'spec_helper'

describe Brewery::Refractometer do
  context "Brix to Specific Gravity" do
    let(:tool) { described_class.new(original_brix: 17) }

    describe "#specific_gravity" do
      it "should return the specific gravity of the original brix" do
        expect(tool.specific_gravity).to eql(1.0706483000102098)
      end
    end
  end

  context "Corrected Final Gravity & ABV% by Brix" do
    let(:tool) { described_class.new(original_brix: 17, final_brix: 7.5) }

    it { expect(tool.final_gravity).to eql(1.0049822062500002) }
    it { expect(tool.index_of_refraction).to eql(1.34404970008125) }
    it { expect(tool.alcohol_by_weight).to eql(6.734352775327011) }
    it { expect(tool.alcohol_by_volume).to eql(8.523809458203969) }
  end
end
