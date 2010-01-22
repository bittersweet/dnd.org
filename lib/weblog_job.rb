class WeblogJob < Struct.new(:weblog_id)
  def perform
    weblog = Weblog.find(weblog_id)
    Twitterupdate::update("New blog post: #{weblog.title} http://denachtdienst.org/weblogs/#{weblog.to_param}")
  end
end
