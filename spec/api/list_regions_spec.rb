require 'rails_helper'

describe "listing regions", type: :api do

  # Note that this feature will need to account for scoping to cities
  # when we finally add more; right now, let's just return all regions
  # we can find for any development.

  def do_get
    get "/api/regions", format: :json
  end

  def parsed_response
    JSON.parse last_response.body
  end

  context "with no developments" do
    it "is an empty set" do
      do_get
      expect(parsed_response['regions']).to eql([])
    end
  end

  context "with one development" do
    let!(:development) { create(:development, region: "Oxford") }

    it "includes the region of that development" do
      do_get
      expect(parsed_response['regions']).to include("name" => 'Oxford')
    end
  end

  context "with two developments" do
    let!(:development1) { create(:development, region: "Oxford") }
    let!(:development2) { create(:development, region: "Dinkleberry") }

    it "includes the region of the first development" do
      do_get
      expect(parsed_response['regions']).to include("name" => 'Oxford')
    end

    it "includes the region of the second development" do
      do_get
      expect(parsed_response['regions']).to include("name" => 'Dinkleberry')
    end
  end

end
