require 'spec_helper'

describe Brewery::Guides do
  context "BJCP Beer Style Guidelines" do
    let(:guide) { Brewery.guides :bjcp }

    describe ".styles" do
      it "returns all styles" do
        expect(guide.styles.count).to eql(80)
      end

      context "Basic data and Vital Statistics" do
        let(:style) { guide.styles.first }

        it { expect(style.name).to eq("Lite American Lager") }
        it { expect(style.id).to eq("1A") }

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

    describe ".categories" do
      it "returns all categories" do
        expect(guide.categories.count).to eql(23)
      end

      context "category data" do
        let(:category) { guide.categories.first }

        it { expect(category.name).to eq('Light Lager') }
        it { expect(category.id).to eq('1') }
      end
    end

    describe ".find" do
      context "when the style is found" do
        let(:result) { guide.find(id: '14B') }

        it "returns the style" do
          expect(result.name).to eq('American IPA')
        end
      end

      context "when the style is not found" do
        let(:result) { guide.find(id: 'xxx') }

        it "returns nil" do
          expect(result).to be_nil
        end
      end
    end
  end
end
