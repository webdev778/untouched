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
end

