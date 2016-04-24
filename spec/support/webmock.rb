require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.before(:each) do |example|
    unless example.metadata[:vcr]
      stub_request(:get, /maps\.google\.com/).
        to_return(status: 200, body: fixture_file('webmock/valid_geocode_response.json').read, headers: {})
    end
  end
end



