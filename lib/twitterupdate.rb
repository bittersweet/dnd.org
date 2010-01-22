class Twitterupdate
  def self.update(content)
    httpauth = Twitter::HTTPAuth.new(APP_CONFIG['username'], APP_CONFIG['password'])

    client = Twitter::Base.new(httpauth)
    client.update(content)
  end
end
