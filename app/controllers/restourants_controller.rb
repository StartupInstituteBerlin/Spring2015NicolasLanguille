class RestourantsController < ApplicationController
  before_action :authenticate_user!, except: [ :index , :show]

  def index
    @owner =  user_signed_in? && current_user.owner?
    @restourants = @owner ? current_user.restourants.all : Restourant.all
  end

  def show
    user_registered = user_signed_in? && current_user.registered?
    @owner = user_signed_in? && current_user.owner?

    user_rate = Rating.find_by(user_id: current_user.id,
                                restourant_id: params[:id])

    @ratable = user_registered && !user_rate
    @restourant = Restourant.find(params[:id])
  end

  def new
    @restourant = current_user.restourants.new()
  end

  def edit
    @restourant = current_user.restourants.find(params[:id])
  end

  def destroy
    @restourant = current_user.restourants.find(params[:id])
    @restourant.destroy
    redirect_to restourants_path
  end

  def update
    @restourant = current_user.restourants.find(params[:id])

    if @restourant.update(restourant_params)
      redirect_to @restourant
    else
      render 'edit'
    end
  end


  def create
    @restourant = current_user.restourants.new(restourant_params)

    if @restourant.save
      redirect_to @restourant
    else
      render 'edit'
    end
  end

  def rate_restourant
    rate = Rating.create(
          user_id: current_user.id,
          restourant_id: params[:restourant_id],
          value: params[:value]
          )
    rate.evaluate_restourant_rate
    render text: 'Your rating has been considered!!!'
  end

  private

  def restourant_params
    params.require(:restourant).permit(:name,:description,
                                :address, :phone, :logo)
  end
end
