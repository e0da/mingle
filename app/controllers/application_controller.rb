class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    unless signed_in?
      redirect_to sign_in_url
    end
  end

  def signed_in?
    session[:admin_id]
  end
  helper_method :signed_in?
end
