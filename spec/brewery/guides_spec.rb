require 'spec_helper'

describe Brewery::Guides do
  context "BJCP Beer Style Guidelines" do
    let(:guide) { Brewery.guides :bjpc }

    it "returns all styles" do
      expect(guide.styles.count).to eql(80)
    end

    it { guide.styles.first.name.should == "Lite American Lager" }
    it { guide.styles.first.og.should == (1.028..1.040) }
    it { guide.styles.first.fg.should == (0.998..1.008) }
    it { guide.styles.first.ibu.should == (8..12) }
    it { guide.styles.first.srm.should == (2.0..3.0) }
    it { guide.styles.first.abv.should == (2.8..4.2) }
  end
end
