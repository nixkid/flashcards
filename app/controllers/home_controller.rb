class HomeController < ApplicationController
  def index
    @card = current_user.cards.where('review_date <= ?', Time.current).order('RANDOM()').take || current_user.cards.order('RANDOM()').take
  end

  def check_translation
    @card = current_user.cards.find(params[:card_id])
    if @card.check_card(params[:translate])
      flash[:notice] = 'Все верно!'
      redirect_to action: :index
    else
      flash.now[:error] = 'Не правильно, попробуй еще раз'
      render :index
    end
  end
end
