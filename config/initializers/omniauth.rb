if Rails.env.production?
  ENV['GITHUB_KEY'] = 'c26ed2c604c968091462'
  ENV['GITHUB_SECRET'] = '29b610428f0f6ec3aecd5e7c31067f0317c8dcc5'
else
  ENV['GITHUB_KEY'] = 'cb9176883591da3759fd'
  ENV['GITHUB_SECRET'] = 'c19270b8e7c042c1def000d46e2ccf895c2f5a8e'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end
