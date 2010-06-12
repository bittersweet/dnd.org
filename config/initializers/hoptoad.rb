HoptoadNotifier.configure do |config|
  config.api_key = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]['hoptoad']
end
