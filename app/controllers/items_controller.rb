class ItemsController < ApplicationController
  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    authorize @item
    if @item.save
      redirect_to men_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    authorize @item
  end

  def update
    @item = Item.find(params[:id])
    authorize @item
    @item.update(item_params)
    redirect_to root_path

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
