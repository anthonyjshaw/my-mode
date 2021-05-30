class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home men women search]

  def home
  end

  def men
  end

  def women
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @category = params[:category]
    @gender = request.path
    @query = case @gender
            when "/men/#{params[:category]}"
              'men'
            when "/women/#{params[:category]}"
              'women'
            end
    @items = Item.where(clothes_type: @category, gender: @query)
  end

end
