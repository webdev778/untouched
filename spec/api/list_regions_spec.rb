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

  context "with no regions" do
    it "is an empty set" do
      do_get
      expect(parsed_response['regions']).to eql([])
    end
  end

  context "with one region" do
    let!(:region) { create(:region, name: "Oxford") }

    it "includes the region of that development" do
      do_get
      expect(parsed_response['regions'][0]).to include("name" => 'Oxford')
    end
  end

  context "with two developments" do
    let!(:region1) { create(:region, name: "Oxford") }
    let!(:region2) { create(:region, name: "Dinkleberry") }

    it "includes the region of the first development" do
      do_get
      expect(parsed_response['regions'][0]).to include("name" => 'Oxford')
    end

    it "includes the region of the second development" do
      do_get
      expect(parsed_response['regions'][1]).to include("name" => 'Dinkleberry')
    end
  end

end
