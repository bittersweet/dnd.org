class ArticleJob < Struct.new(:article_id)
  def perform
    article = Article.find(article_id)
    Twitterupdate::update("New blog post: #{article.title} http://denachtdienst.org/articles/#{article.to_param}")
  end
end
