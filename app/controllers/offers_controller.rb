class OffersController < ApplicationController
  before_filter :authorize_user!

  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
    @users = User.all
  end

  def create
    @offer = Offer.new(offer_param)

    if @offer.save
      redirect_to :action => 'index'
    else
      @users = User.all
      render :action => 'new'
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])

    if @offer.update_attributes(offer_param)
      redirect_to :action => 'index'
    else
      @users = User.all
      render :action => 'edit'
    end
  end

  def offer_param
    params.require(:offer).permit(:user_id, :offerdetails)
  end

  def destroy
    Offer.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
end
