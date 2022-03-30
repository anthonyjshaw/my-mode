class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search blog about]

  def home
    dashboard if user_signed_in?
  end

  def about; end

  def blog
    @blogs = policy_scope(Blog).includes(:user)
  end

  def notifications
  end

  def search; end

  private

  def dashboard
    @feed = policy_scope(Style)
            .includes([:user, [photo_attachment: :blob]])
            .where.not(user: current_user).order(created_at: :desc)
            .first(3)
    @my_styles = policy_scope(Style)
                 .includes([:user, [photo_attachment: :blob]])
                 .where(user: current_user)
                 .order(created_at: :desc)
                 .first(3)
    @liked_styles = user_signed_in? ? current_user.favorited_by_type('Style').includes([:user]).order(created_at: :desc).first(3) : []
  end
end
