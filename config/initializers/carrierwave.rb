require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAXOQMWY3IQN6BP7FR',
      aws_secret_access_key: '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',
      region: 'us-east-1' 
    }
    config.fog_directory  = 'appmshare' # 作成したS3バケット名
  end
  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end