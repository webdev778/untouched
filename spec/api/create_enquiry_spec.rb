require 'rails_helper'

describe "creating an enquiry", type: :api do

  let(:unit) { double('unit', id: 1234) }

  def do_post
    post "/api/enquiries", post_params
  end

  context "with valid params" do
    def post_params
      {
        enquiry: {
        name: "Teejay VanSlyke",
        email: "tj@guilded.co",
        body: "Wow, I love this property",
        unit_id: unit.id,
        mortgage: true
      }
      }
    end

    it "renders a 200 response" do
      do_post
      expect(last_response.status).to eq(200)
    end

    it "creates an enquiry" do
      expect { do_post }.to change(Enquiry, :count).from(0).to(1)
    end
  end
end

