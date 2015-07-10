Recaptcha.configure do |config|
  config.public_key  = '6Ld5Md8SAAAAALwEXCU5CIwkQvtFTHWQai6MYBR3'
  config.private_key = '6Ld5Md8SAAAAAEtTuK8iCHPzKXtLPsSCW7lwpEPU'
  #config.proxy = 'http://myproxy.com.au:8080'
  # Uncomment if you want to use the newer version of the API,
  # only works for versions >= 0.3.7:
  config.api_version = 'v2'
end
