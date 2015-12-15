class HomeController < ApplicationController
  def index
    @card = current_user.cards.random_card
  end
  
  def check_translation
    @card = current_user.cards.find(params[:card_id])
    if @card.check_card(params[:translate])
      p :right
      flash[:notice] = 'Все верно!'
      redirect_to action: :index
    else
      p :wrong
      flash.now[:error] = 'Не правильно, попробуй еще раз'
      render :index
    end
  end
end
