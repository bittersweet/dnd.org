module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage
    "/"
  end

  def artists_index
    '/artists'
  end

  def artist_show(id)
    "/artists/#{id}"
  end

end

RSpec.configuration.include NavigationHelpers, :type => :acceptance
