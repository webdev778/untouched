require 'rails_helper'

RSpec.describe Development, type: :model do
  it { should have_many(:units) }
end
