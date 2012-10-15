class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Administrator.find_by_username(params[:username])
    if admin.try(:authenticate, params[:password])
      session[:admin_id] = admin.id
      redirect_to root_url
    else
      flash.now[:error] = 'Sign in failed'
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
