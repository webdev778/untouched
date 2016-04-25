require 'rails_helper'

RSpec.describe Unit, type: :model do
  subject { build(:unit) } 

  describe "relationships" do
    it { should belong_to(:development) }
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:number).scoped_to(:development_id) }
  end

  describe "statuses" do
    it "allows setting the status to 'active'" do
      expect(Unit.statuses).to have_key('active')
    end

    it "allows setting the status to 'retained'" do
      expect(Unit.statuses).to have_key('held')
    end

    it "allows setting the status to 'sold'" do
      expect(Unit.statuses).to have_key('sold')
    end
  end

  describe "#deposit" do
    context "when the development has a 10% deposit and the unit costs $100,000" do
      let(:development) { build(:development, deposit_percent: 0.1) }
      let(:unit) { build(:unit, development: development, price: 100_000) }

      it "has a $10_000 deposit" do
        expect(unit.deposit).to eq(10_000)
      end
    end

    context "when the development has a 5% deposit and the unit costs $100,000" do
      let(:development) { build(:development, deposit_percent: 0.05) }
      let(:unit) { build(:unit, development: development, price: 100_000) }

      it "has a $5_000 deposit" do
        expect(unit.deposit).to eq(5_000)
      end
    end
  end
end

