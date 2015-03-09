class RestourantsController < ApplicationController

  def index
    @restourants = Restourant.all

  end

  def show

    @restourant = Restourant.find(params[:id])
  end

  def new
    @restourant = Restourant.new()
  end

  def edit
    @restourant = Restourant.find(params[:id])
  end

  def destroy
    @restourant = Restourant.find(params[:id])
    @restourant.destroy

    redirect_to restourants_path

  end

  def update
    @restourant = Restourant.find(params[:id])

    if @restourant.update(restourant_params)
      redirect_to @restourant
    else
      render 'edit'
    end
  end


  def create
    @restourant = Restourant.new(restourant_params)

    if @restourant.save
      # Tell the UserMailer to send a welcome email after save

      redirect_to @restourant
    else
      redirect_to edit # should work when @message.save is 'false'
    end
  end

  private

    def restourant_params
      params.require(:restourant).permit(:name,:description,:address, :phone)
    end
end
