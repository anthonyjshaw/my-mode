class BlogsController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[show ]

    def show
      @blog = Blog.find(params[:id])
      authorize @blog
    end
end
