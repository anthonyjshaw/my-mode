class ItemsController < ApplicationController
  def new
    @style = Style.find(params[:style_id])
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.style = Style.find(params[:style_id])
    authorize @item
    if @item.save
      redirect_to style_path(@item.style)
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
                                 :name, :photo)
  end
end
