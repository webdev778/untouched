require 'rails_helper'

RSpec.describe Enquiry, type: :model do
  it { should belong_to(:unit) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:unit_id) }
end
