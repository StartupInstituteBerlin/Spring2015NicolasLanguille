class RestourantsController < ApplicationController
  before_action :authenticate_user!, except: [ :index , :show]

  def index
    @owner =  user_signed_in? && current_user.owner?
    @restourants = @owner ? current_user.restourants.all : Restourant.all
  end

  def show
    @registered = user_signed_in? && current_user.registered?
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
    Rating.create(
          user_id: current_user.id,
          restourant_id: params[:restourant_id],
          value: params[:value]
          )

    render text: 'You rating has been considered!!!'
  end

  private

  def restourant_params
    params.require(:restourant).permit(:name,:description,:address, :phone)
  end
end
