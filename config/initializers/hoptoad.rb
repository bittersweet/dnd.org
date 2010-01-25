HoptoadNotifier.configure do |config|
  config.api_key = YAML.load_file("#{RAILS_ROOT}/config/config.yml")[RAILS_ENV]['hoptoad']
end
