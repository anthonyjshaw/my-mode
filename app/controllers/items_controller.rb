class ItemsController < ApplicationController

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    authorize @item
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:clothes_type,
                                 :color,
                                 :description,
                                 :size,
                                 :price,
                                 :quantity,
                                 :name,
                                 :is_in_stock,
                                 :gender)
  end
end
