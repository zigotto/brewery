require 'spec_helper'

describe Brewery::Guides do
  context "BJCP Beer Style Guidelines" do
    let(:guide) { Brewery.guides :bjcp }

    it "returns all styles" do
      expect(guide.styles.count).to eql(80)
    end

    it { expect(guide.styles.first.name).to eq("Lite American Lager") }

    context "Vital Statistics" do
      let(:style) { guide.styles.first }

      it { expect(style.og_low).to eql(1.028) }
      it { expect(style.og_high).to eql(1.040) }

      it { expect(style.fg_low).to eql(0.998) }
      it { expect(style.fg_high).to eql(1.008) }

      it { expect(style.ibu_low).to eql(8.0) }
      it { expect(style.ibu_high).to eql(12.0) }

      it { expect(style.srm_low).to eql(2.0) }
      it { expect(style.srm_high).to eql(3.0) }

      it { expect(style.abv_low).to eql(2.8) }
      it { expect(style.abv_high).to eql(4.2) }
    end
  end
end
