class StylesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_style, only: %i[show update destroy edit]
  before_action :style_items, only: :show
  before_action :set_item, only: %i[show new]

  def index
    if params[:query].present?
      # @styles = policy_scope(Style).search 'sum', fields: [:name], match: :word_middle
      @styles = policy_scope(Style)
                .search_by_name_and_description(params[:query])
                .where.not(user: current_user)
                .includes([[photo_attachment: :blob], :user])
                .page(params[:page])
    else
      @styles = policy_scope(Style)
                .where.not(user: current_user)
                .includes([[photo_attachment: :blob], :user])
                .page(params[:page])
    end
  end

  def my_styles
    @my_styles = policy_scope(Style).where(user: current_user).includes([photo_attachment: :blob])
    authorize @my_styles
  end

  def new
    @style = Style.new
    authorize @style
  end

  def show
    @comment = Comment.new
    @reply = Reply.new
    respond_to do |format|
      format.html
      format.json { render json: { style: @style } }
    end
  end

  def toggle_favorite
    @style = Style.find(params[:id])
    authorize @style
    current_user.favorited?(@style) ? current_user.unfavorite(@style) : current_user.favorite(@style)
  end

  def toggle_like_items
  end

  def create
    @style = Style.new(style_params)
    @style.user = current_user
    authorize @style
    if @style.save!
      redirect_to style_path(@style)
    else
      render :new
    end
  end

  def liked_styles
    @styles = current_user.favorited_by_type('Style').order(created_at: :asc)
    authorize @styles
  end

  private

  def style_params
    params.require(:style).permit(:name, :description, :photo)
  end

  def set_style
    @style = Style.find(params[:id])
    authorize @style
    @comments = Comment.where(style: @style).includes(%i[user replies]).order(created_at: :desc)
  end

  def set_item
    @item = Item.new
  end

  def style_items
    @items = @style.items.includes([photo_attachment: :blob]).sort_by { |a| Item::ITEM_CATEGORIES.index(a[:clothes_type]) }
  end
end
