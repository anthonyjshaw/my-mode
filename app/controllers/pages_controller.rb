class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home men women search]

  def home
  end

  def men
    @items = Item.where(gender: params[:gender])
  end

  def women
    @items = Item.where(gender: params[:gender])
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @gender = params[:gender]
    @category = params[:category]
    @items = Item.where(gender: @gender, clothes_type: @category)
  end

  def search
  end


end
