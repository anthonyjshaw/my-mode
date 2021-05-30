class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home men women search]

  def home
  end

  def men
    @items = Item.where(gender: 'men')
  end

  def women
    @items = Item.where(gender: 'women')
  end

  def search
  end
end
