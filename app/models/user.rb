class User < ActiveRecord::Base
  devise :authenticatable, :recoverable, :rememberable, :trackable, :registerable

  attr_accessible :email, :password, :password_confirmation
end
