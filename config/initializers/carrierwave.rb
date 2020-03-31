require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAJAZTCQLDWB6XIDIA',
      aws_secret_access_key: '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',
      region: 'us-east-1'  # S3バケット作成時に指定したリージョン。左記は東京を指す
    }
    config.fog_directory  = 'appmshare' # 作成したS3バケット名
  end
  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end