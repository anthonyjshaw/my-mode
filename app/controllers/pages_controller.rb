class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search]

  def home
  end

  def show
    @item = Item.find(params[:id])
  end

end
