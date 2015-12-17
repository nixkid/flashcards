class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      if login(@user.email, params[:user][:password], false)
        redirect_to new_card_path, :notice => "Вы успешно зарегестрированы!"
      end
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(current_user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
