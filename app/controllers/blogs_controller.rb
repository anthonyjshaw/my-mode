class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_blog, only: %i[show update destroy edit]


  def show 
  end

  def new
    @blog = Blog.new
    authorize @blog
  end
  
  def edit; end

  def create
    @blog = Blog.new(blog_params)
    authorize @blog
    @blog.user = current_user
    if @blog.save
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blog_posts_path
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
    authorize @blog  # For Pundit
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :photo, :blurb)
  end
end
