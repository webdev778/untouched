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
end
