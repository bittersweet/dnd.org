class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :registerable

  attr_accessible :email, :password, :password_confirmation
end
