# config/initializers/carrierwave.rb

CarrierWave.configure do |config|
  config.aws_bucket   = ENV["AWS_BUCKET"]
  config.aws_acl      = "public-read"

  config.aws_credentials = {
    access_key_id:      ENV["AWS_ACCESS_KEY"], # required
    secret_access_key:  ENV["AWS_SECRET_KEY"], # required
    region:             ENV["AWS_REGION"]
  }

  if Rails.env.development?
    config.cache_dir = '/vagrant/src/flixter/public'
    config.root = '/vagrant/src/flixter/public'
    config.storage = :file
  else
    config.storage      = :aws
  end
end
