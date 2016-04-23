require 'rails_helper'

describe Untouched::Seeds::Developments do
  let(:seed) { Untouched::Seeds::Developments.new(Rails.root.join(*%w(spec fixtures seeds developments.yml)).to_s) }

  it "creates one development" do
    expect { seed.run }.to change(Development, :count).by(1)
  end

  describe "the resulting development" do
    before { seed.run }
    subject { Development.first }

    it "has a suburb" do
      expect(subject.suburb.name).to eq('Astoria')
    end

    it "has a logo" do
      expect(subject.logo.file).to_not be_blank
    end

    it "has an address" do
      expect(subject.address).to eq('123 Main Street')
    end

    it "has 2 photos" do
      expect(subject.photos.count).to eq(2)
    end

    describe "the first photo" do
      subject { Development.first.photos.first }

      it "has a caption" do
        expect(subject.caption).to eq("Look at this balcony!")
      end

      it "has a file" do
        expect(subject.file).to_not be_blank
      end
    end

    it "has 2 units" do
      expect(subject.units.count).to eq(2)
    end

    describe "the first unit" do
      subject { Development.first.units.first }
      
      it "has the number of bedrooms specified in the seed" do
        expect(subject.bedrooms).to eq(2)
      end

      it "has the number of bathrooms specified in the seed" do
        expect(subject.bedrooms).to eq(2)
      end

      it "has 2 views" do
        expect(subject.views.count).to eq(2)
      end

      it "has 2 plans" do
        expect(subject.plans.count).to eq(2)
      end
    end
  end

end

