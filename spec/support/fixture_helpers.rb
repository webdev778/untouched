module FixtureHelpers
  def fixture_file(name)
    File.open Rails.root.join('spec', 'fixtures', name).to_s
  end
end

if defined?(RSpec)
  RSpec.configure { |config| config.include FixtureHelpers }
end

