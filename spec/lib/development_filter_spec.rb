require 'rails_helper'
require 'development_filter'

describe DevelopmentFilter do
  context "with no options" do
    subject { DevelopmentFilter.new }
    let!(:development_1) { create(:development) }
    let!(:development_2) { create(:development) }

    it "returns one item for each development" do
      expect(subject.results.length).to eq(2)
    end

    describe "the first development result" do
      let(:least_expensive_unit) { development_1.units.order('price ASC').first }
      it "returns the least expensive unit" do
        p subject.results
        expect(subject.results.first).to eq(least_expensive_unit)
      end
    end

    describe "the second development result" do
      let(:least_expensive_unit) { development_2.units.order('price ASC').first }
      it "returns the least expensive unit" do
        expect(subject.results.last).to eq(least_expensive_unit)
      end
    end
  end
end

