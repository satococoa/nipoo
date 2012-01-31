unless Rails.env.production?
  ENV['GITHUB_KEY'] = 'cb9176883591da3759fd'
  ENV['GITHUB_SECRET'] = 'c19270b8e7c042c1def000d46e2ccf895c2f5a8e'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end
