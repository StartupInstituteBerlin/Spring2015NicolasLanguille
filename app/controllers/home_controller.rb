class HomeController < ApplicationController
  def index
    if current_user
      redirect_to restourants_path
    end
  end
end
