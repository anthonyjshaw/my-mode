class StylesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @styles = policy_scope(Style)
  end

  def my_styles
    @styles = policy_scope(Style).where(user: current_user)
    authorize @styles
  end

  def new
    @style = Style.new
    authorize @style
  end

  def create
    @style = Style.new(style_params)
    authorize @style
  end

  private

  def style_params
    params.require(:style).permit(:name)
  end
end
