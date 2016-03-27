require 'rails_helper'

RSpec.describe Suburb, type: :model do
  it { should belong_to(:region) }
end
