require 'rails_helper'

describe DevelopmentLogoSerializer do
  it "inherits from ImageSerializer" do
    expect(DevelopmentLogoSerializer.ancestors).to include(ImageSerializer)
  end
end

