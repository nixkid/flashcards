class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to(new_card_path, notice: "Успешно зашли")
    else
      flash.now[:error] = "Вы не смогли зайти"
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(action: 'new')
  end
end
