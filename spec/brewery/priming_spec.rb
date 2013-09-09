require 'spec_helper'

describe Brewery::Priming do
  let(:priming) { described_class.new(radius: 8.5, height: 11.5) }

  it { expect(priming.volume_of_cylinder).to eql(2.609) }

  describe "#total" do
    it "returns total of sugar and water" do
      sugar, water = priming.total(sugar: 6)

      expect(sugar).to eql(15.654)
      expect(water).to eql(46.962)
    end
  end
end
