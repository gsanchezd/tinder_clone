if Rails.env.test? 
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.storage = :aws
    config.aws_credentials = {
      :access_key_id          => ENV['aws_access_key_id'],      # required
      :secret_access_key      => ENV['aws_secret_access_key'],  # required
      :region                 => 'us-east-1',                   # optional, defaults to 'us-east-1'
      # :host                   => 's3.amazonaws.com'
      #:host                   => 's3.example.com',             # optional, defaults to nil
      :endpoint               => 'http://s3.amazonaws.com' # optional, defaults to nil
    }
    config.aws_bucket     = ENV['aws_dir']                          # required
    config.aws_acl        = 'public-read'
    
    config.aws_attributes = {
      expires: 1.week.from_now.httpdate,
      cache_control: 'max-age=604800'
    }

  end
end
