class RestourantsController < ApplicationController
  before_action :authenticate_user!, except: [ :index , :show]

  def index
    @restourants = Restourant.all

  end

  def show

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
      # Tell the UserMailer to send a welcome email after save

      redirect_to @restourant
    else
      render 'edit' # should work when @message.save is 'false'
    end
  end

  private

    def restourant_params
      params.require(:restourant).permit(:name,:description,:address, :phone)
    end
end
