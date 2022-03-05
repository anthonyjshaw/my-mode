class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @blog = Blog.find(params[:id])
  
    authorize @blog
    @content = @blog.content.split("\r\n\r\n")
    
      
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
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    authorize @blog

    @blog.destroy
    redirect_to blog_posts_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
