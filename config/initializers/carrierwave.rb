CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => 'AKIAJ5XIT43YPK54YP6A',
    :aws_secret_access_key => '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',
  }

  config.fog_directory = 'yesser1'
  config.fog_public = true
  config.fog_attributes = {'Cache-Control' => 'max-age=315576000'} 
end
