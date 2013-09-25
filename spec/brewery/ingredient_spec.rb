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

  context "Hops" do
    let(:hops) { Brewery.ingredients :hops }

    it { expect(hops.count).to eql(85) }

    context "hops data" do
      let(:hop) { hops.first }

      it { expect(hop.description).to include('Exciting hop variety that was new in 2010 from Australia.') }
      it { expect(hop.alpha).to eq('15.000000') }
      it { expect(hop.variety).to eq('Australian Galaxy') }
    end
  end

  context "Yeast" do
    let(:yeasts) { Brewery.ingredients :yeasts }

    it { expect(yeasts.count).to eql(208) }

    context "yeast data" do
      let(:yeast) { yeasts.first }

      it { expect(yeast.description).to include('General purpose top fermenting strain.') }
      it { expect(yeast.yeast_type).to eq('Liquid') }
      it { expect(yeast.beer_type).to eq('Ale') }
      it { expect(yeast.attenuation).to eq('75.000000') }
      it { expect(yeast.name).to eq('Brewferm Ale Yeast') }
    end
  end
end
