class Article < ActiveRecord::Base

  def to_param
    "#{id}-#{title.parameterize}"
  end

  validates_presence_of :title,   :message => "can't be blank"
  validates_presence_of :content, :message => "can't be blank"

  scope :latest, :limit => 4, :order => 'id DESC'

protected

  after_save :update_twitter
  def update_twitter
    Delayed::Job.enqueue(ArticleJob.new(id))
  end

end