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

end

