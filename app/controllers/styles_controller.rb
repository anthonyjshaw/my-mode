class StylesController < ApplicationController

  def index
    @styles = policy_scope(Style).all
  end

  def my_styles
    @styles = policy_scope(Style).where(user: current_user)
    authorize @styles
  end
end
