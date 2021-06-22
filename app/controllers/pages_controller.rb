class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search blog]

  def home
  end

  def about; end

  def show
    @item = Item.find(params[:id])
  end

  def blog; end
end
