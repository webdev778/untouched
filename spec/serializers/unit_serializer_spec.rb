require 'rails_helper'

describe UnitSerializer do

  let(:unit) { create(:unit) }
  subject { UnitSerializer.new(unit).as_json(root: false) }

  it "has a number" do
    expect(subject).to include(number: unit.number)
  end

  it "includes the unit's development ID" do
    expect(subject).to include(development_id: unit.development_id)
  end

  it "has stamp duty" do
    expect(subject).to include(stamp_duty: unit.stamp_duty)
  end

  it "has a deposit" do
    expect(subject).to include(deposit: unit.deposit)
  end

  it "has a deposit percent" do
    expect(subject).to include(deposit_percent: unit.deposit_percent)
  end

end

