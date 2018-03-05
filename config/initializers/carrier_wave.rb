if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAIORPGLTXI6MXACOQ'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
  end
end
