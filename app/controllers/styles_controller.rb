class StylesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @styles = policy_scope(Style)
  end

  def my_styles
    @styles = policy_scope(Style).where(user: current_user)
    authorize @styles
  end
end
