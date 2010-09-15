module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage
    '/'
  end

  def artists_index
    '/artists'
  end

  def artist_show(id)
    "/artists/#{id}"
  end

  def user_register
    '/users/register'
  end

  def user_login
    '/users/login'
  end

  def user_password
    'users/password/edit'
  end

  def user_edit
    '/users/edit/'
  end

  def admin_overview
    '/admin'
  end

  def artists_overview
    '/admin/artists'
  end

end

RSpec.configuration.include NavigationHelpers, :type => :acceptance
