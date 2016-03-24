CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root }/tmp/uploads"

  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog

    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'us-west-1'
    }

    config.fog_directory = "assets-untouched-staging"
  end
end
