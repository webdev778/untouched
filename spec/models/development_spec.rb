require 'rails_helper'

RSpec.describe Development, type: :model do
  it { should have_many(:units) }

  describe "geolocation", vcr: true do
    context "when geolocating 71 Inkerman St St Kilda" do
      let(:region) { create(:region, name: 'South') }
      let(:suburb) { create(:suburb, name: 'St Kilda', region: region) }
      subject { create(:development, address: '71 Inkerman St', suburb: suburb, city: 'Melbourne') }
      it "has the correct latitude" do
        expect(subject.lat).to eq(-37.864718)
      end
      it "has the correct longitude" do
        expect(subject.lng).to eq(144.984532)
      end
    end

    context "when I can't geocode the address" do
      subject { lambda { create(:development, address: "I DONT KNOW WHAT THIS IS HELLLLLP") } }
      it "doesn't set a latitude" do
        expect(subject.call.lat).to be_nil
      end

      it "doesn't set a longitude" do
        expect(subject.call.lng).to be_nil
      end

      it "doesn't complain" do
        expect(subject).not_to raise_error
      end
    end
  end

  describe "#contract_url" do
    let(:development) { build(:development) }
    let(:contract) { double('contract') }

    context "when there's a contract" do
      before { expect(development).to receive(:contract).and_return(contract) }
      it "returns the contract's URL" do
        expect(contract).to receive(:url).and_return('http://the.contract')
        expect(development.contract_url).to eq('http://the.contract')
      end
    end

    context "when there's not a contract" do
      it "returns nil" do
        expect(development.contract_url).to be_nil
      end
    end
  end
end
