class SessionsController < ApplicationController
  # Non richiede login prima delle action Create e New, before_action applicato in application_controller
  skip_before_action :require_login, only: [:create, :new]

  def new
  end

  def create
    session_params = params.permit(:username, :password)
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Email o Password errate!"
      redirect_to new_session_path
    end
  end

  def destroy
    # Rimuove user id dalla sessione corrente dopo il logout
    session[:user_id] = nil
    # Messaggio di logout
    flash[:notice] = "You have been signed out!"
    # Reindirizza alla homepage
    redirect_to root_path
  end
end
