class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home men women search]

  before_action :set_modals
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
  private

  def set_modals
    @modal_signup = "2"
    @modal_login = "1"
  end
end
