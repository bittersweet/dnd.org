class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable

  attr_accessible :email, :password
end
