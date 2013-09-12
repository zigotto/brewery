require 'spec_helper'

describe Brewery::Refractometer do
  describe ".style" do
    let(:tool) {
      Brewery.tools :refractometer do
        style '14B'
      end
    }

    it { expect(tool.style.name).to eq('American IPA') }
  end

  context "Corrected Final Gravity and ABV by Brix" do
    let(:tool) {
      american_ipa = Brewery.guides(:bjcp).find(id: '14B')

      Brewery.tools :refractometer do
        style american_ipa

        original_brix 17
        final_brix 7.5
      end
    }

    describe ".original_gravity" do
      it { expect(tool.original_gravity).to eql(1.0706483000102098) }
    end

    describe ".final_gravity" do
      it { expect(tool.final_gravity).to eql(1.0049822062500002) }
    end

    describe ".index_of_refraction" do
      it { expect(tool.index_of_refraction).to eql(1.34404970008125) }
    end

    describe ".alcohol_by_weight" do
      it { expect(tool.alcohol_by_weight).to eql(6.734352775327011) }
    end

    describe ".alcohol_by_volume" do
      it { expect(tool.alcohol_by_volume).to eql(8.523809458203969) }
    end
  end
end
