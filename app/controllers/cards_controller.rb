class CardsController < ApplicationController
  before_action :correct_user, only: :destroy
  
  def index
    @cards = current_user.cards
  end

  def show
    @card = current_user.cards.find_by(id: params[:id])
  end

  def new
    @card = current_user.cards.new
  end

  def edit
    @card = current_user.cards.find(params[:id])
  end

  def create
    @card = current_user.cards.build(card_params)

    if @card.save
      flash[:notice] = "Новая карточка создана"
      redirect_to @card
    else
      render :new
    end
  end

  def update
    @card = current_user.cards.find(params[:id])

    if @card.update(card_params)
      redirect_to @card
    else
      render :edit
    end
  end

  def destroy
    @card = current_user.cards.find(params[:id])
    @card.destroy

    redirect_to cards_path
  end

  private

  def card_params
   params.require(:card).permit(:original_text, :translated_text)
  end
  
  def correct_user
    @card = current_user.cards.find_by(id: params[:id])
    redirect_to new_card_path if @cards.nil?
  end
end