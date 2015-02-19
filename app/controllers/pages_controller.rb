class PagesController < ApplicationController
  
  before_action :authenticate_user!, only: [:dashboard]

  def home
  	if current_user
  		redirect_to items_path
  	end
  	@items = Item.last(4)
  end

  def dashboard
  	@items = current_user.items
  end
end
