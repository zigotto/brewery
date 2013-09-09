require 'spec_helper'

describe Brewery::Guides do
  context "BJCP Beer Style Guidelines" do
    let(:guide) { Brewery.guides :bjpc }

    it "returns all styles" do
      expect(guide.styles.count).to eql(80)
    end

    it { guide.styles.first.name.should == "Lite American Lager" }

    context "Vital Statistics" do
      it { guide.styles.first.og_low.should eql(1.028) }
      it { guide.styles.first.og_high.should eql(1.040) }

      it { guide.styles.first.fg_low.should eql(0.998) }
      it { guide.styles.first.fg_high.should eql(1.008) }

      it { guide.styles.first.ibu_low.should eql(8.0) }
      it { guide.styles.first.ibu_high.should eql(12.0) }

      it { guide.styles.first.srm_low.should eql(2.0) }
      it { guide.styles.first.srm_high.should eql(3.0) }

      it { guide.styles.first.abv_low.should eql(2.8) }
      it { guide.styles.first.abv_high.should eql(4.2) }
    end
  end
end
