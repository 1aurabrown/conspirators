CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['CONSPIRATORS_AWS_ID'],
      aws_secret_access_key: ENV['CONSPIRATORS_AWS_KEY'],
      region:                'eu-central-1',
      endpoint:              'https://eu-central-1.amazonaws.com'
    }

    config.storage        = :fog
    config.fog_directory  = 'conspirators-berlin'
    config.fog_public     = true
    config.fog_attributes = {'Cache-Control' => 'max-age = 315576000'}
  end
end
