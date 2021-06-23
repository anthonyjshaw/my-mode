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
    if @item.update(item_params)
      redirect_to style_path(@item.style)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:clothes_type,
                                 :color,
                                 :description,
                                 :size,
                                 :price,
                                 :name)
  end
end
