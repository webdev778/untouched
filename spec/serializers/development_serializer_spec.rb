require 'rails_helper'

describe DevelopmentSerializer do

  let(:development) { create(:development) }
  subject { DevelopmentSerializer.new(development).as_json(root: false) }

  it "has an ID" do
    expect(subject).to include(id: development.id)
  end

  it "has a latitude" do
    expect(subject).to have_key(:lat)
  end

  it "has a longitude" do
    expect(subject).to have_key(:lng)
  end

  it "has a deposit percent" do
    expect(subject).to include(deposit_percent: development.deposit_percent)
  end

  it "has a count of the total number of units" do
    expect(subject).to include(units_count: development.units.count)
  end

  it "has a count of the number of units sold" do
    expect(subject).to include(units_sold_count: development.units.sold.count)
  end
end

