require 'spec_helper'

describe Brewery::Ingredient do
  context "Fermentables" do
    let(:fermentables) { Brewery.ingredients :fermentables }

    it { expect(fermentables.count).to eql(187) }

    context "fermentable data" do
      let(:fermentable) { fermentables.first }

      it { expect(fermentable.description).to include('Amber malt is a roasted malt that is used in mild ales') }
      it { expect(fermentable.color).to eq('22.000000') }
      it { expect(fermentable.moisture).to eq('3.000000') }
      it { expect(fermentable.extract).to eq('80.000000') }
      it { expect(fermentable.name).to eq('Australian Amber Malt') }
    end
  end
end
