class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_style, only: %i[show update destroy edit]
  before_action :style_items, only: :show
  before_action :set_item, only: %i[show new]

end
