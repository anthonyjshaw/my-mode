class BlogsController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[show ]

    def show
      @blog = Blog.find(params[:id])
      authorize @blog
    end

    def new
      @blog = Blog.new
      authorize @blog
    end

    def create
      @blog = Blog.new(blog_params)
      authorize @blog
      @blog.user = current_user
      if @blog.save
        redirect_to blog_posts_path
      else
        render :new
      end
    end

    private

    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
