Airbrake.configure do |config|
  config.api_key		= 'cae21198c8cf8bebd647d65b428d5cdd'
  config.host				= 'pbderr.herokuapp.com'
  config.port				= 80
  config.secure			= config.port == 443
end