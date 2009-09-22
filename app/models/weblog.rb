class Weblog < ActiveRecord::Base

  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  validates_presence_of :title, :on => :save, :message => "can't be blank"
  validates_presence_of :content, :on => :save, :message => "can't be blank"
  validates_presence_of :user_id, :on => :save, :message => "can't be blank"

end
