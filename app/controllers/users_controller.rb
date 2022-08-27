class UsersController < ApplicationController
    # Non richiede login prima delle action Create e New
    skip_before_action :require_login, only: [:new, :create]

    def show
        @user = User.find(params[:id])
    end
  
    def index
    end
  
    def new
        @user = User.new
    end
  
    def create
      @user = User.create(user_params)
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        flash[:error] = "Error, please try to create an account again."
        redirect_to new_user_path
      end
    end
  
    private 
    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
