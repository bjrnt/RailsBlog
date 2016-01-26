class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # TODO: make sure to only show categories that contain at least one public post
  helper_method :get_categories
  def get_categories
    @categories = Category.all()
  end

  helper_method :current_author
  def current_author
    @current_author ||= Author.find(session[:author_id]) if session[:author_id]
  end

  def authorize
    redirect_to '/login' unless current_author
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end
