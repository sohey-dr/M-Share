CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    :aws_access_key_id  =>   ENV['AWS_S3_ACCESS_KEY_ID'],  # required
    :aws_secret_access_key => ENV['AWS_S3_SECRET_ACCESS_KEY'],     # required
    region:                'us-east-1',                   # optional, defaults to 'us-east-1' オハイオ＝us-east-2
    #host:                  's3.example.com',             # optional, defaults to nil
    #endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'appmshare'                # required
  config.fog_public     = false                                                 # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end