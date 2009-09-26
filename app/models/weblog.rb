class Weblog < ActiveRecord::Base

  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  validates_presence_of :title, :message => "can't be blank"
  validates_presence_of :content, :message => "can't be blank"
  validates_presence_of :user_id, :message => "can't be blank"

end
