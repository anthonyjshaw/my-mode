module Api
  module V1
    class BlogsController < Api::V1::BaseController
      acts_as_token_authentication_handler_for User, except: %i[index show]
      before_action :set_blog, only: %i[show update destroy]

      def index
        @blogs = policy_scope(Blog)
      end

      def show; end

      def update
        if @blog.update(blog_params)
          render :show
        else
          render_error
        end
      end

      def create
        @blog = Blog.new(blog_params)
        @blog.user = current_user
        authorize @blog
        if @blog.save
          render :index, status: :created
        else
          render_error
        end
      end

      def destroy
        @blog.destroy
        head :no_content
        # No need to create a `destroy.json.jbuilder` view
      end

      private

      def set_blog
        @blog = Blog.find(params[:id])
        authorize @blog  # For Pundit
      end

      def blog_params
        params.require(:blog).permit(:title, :content)
      end

      def render_error
        render json: { errors: @blog.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  end
end
