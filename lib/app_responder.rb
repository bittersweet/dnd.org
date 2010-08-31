class AppResponder < ActionController::Responder
  protected

  # Overwrite navigation_behavior to redirect to the collection_location.
  def navigation_behavior(error)
    if get?
      raise error
    elsif has_errors? && default_action
      render :action => default_action
    else
      redirect_to collection_location
    end
  end

  # Returns the collection location for redirecting after POST/PUT/DELETE.
  # This method, converts the following resources array to the following:
  #
  #   [:admin, @post] #=> [:admin, :posts]
  #   [@user, @post]  #=> [@user, :posts]
  #
  # This new arrays, when given to redirect_to, will generate the proper URL
  # pointing to the index action.
  #
  #   [:admin, @post] #=> admin_posts_url
  #   [@user, @post]  #=> user_posts_url(@user.to_param)
  #
  def collection_location
    return options[:location] if options[:location]
    klass = resources.last.class

    if klass.respond_to?(:model_name)
      resources[0...-1] << klass.model_name.plural.to_sym
    else
      resources
    end
  end
end
