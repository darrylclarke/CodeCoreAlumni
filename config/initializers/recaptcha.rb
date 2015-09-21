Recaptcha.configure do |config|
  # For development
  #config.public_key  = '6LczMw0TAAAAAFit-V8YY_pAw0gP7D17ly9eQrrs'
  #config.private_key = '6LczMw0TAAAAAGcFLSfx0IOeQPPLvXjJ7vjVId_r'
  # For DEPLOYMENT
  config.public_key  = '6LeoOA0TAAAAAIGFiD2azfw4WXvA0uX8lV4V-f2v'
  config.private_key = '6LeoOA0TAAAAAP-OkhnUlVDi99Ebz0tQ37gSbwOr'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
  # Uncomment if you want to use the newer version of the API,
  # only works for versions >= 0.3.7:
  # config.api_version = 'v2'
end
