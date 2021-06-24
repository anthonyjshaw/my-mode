class StylesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_styles, only: %i[show update destroy edit]
  def index
    if params[:query].present?
      # @styles = policy_scope(Style).search 'sum', fields: [:name], match: :word_middle
      @styles = policy_scope(Style).search_by_name_and_description(params[:query])
    else
      @styles = policy_scope(Style)
    end
  end

  def my_styles
    @my_styles = policy_scope(Style).where(user: current_user)
    authorize @my_styles
  end

  def new
    @style = Style.new
    authorize @style
  end

  def show; end

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

  def set_styles
    @style = Style.find(params[:id])
    authorize @style
  end

  def style_items
    @accessory = @style.items.find_by(category: 'accessories')
    @top = @style.items.find_by(category: 'tops')
    @trouser = @style.items.find_by(category: 'trousers')
    @footwear = @style.items.find_by(category: 'footwear')
  end
end
