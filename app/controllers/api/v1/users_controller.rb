module Api
  module V1
    class UsersController < Api::V1::BaseController
      # acts_as_token_authentication_handler_for User, except: %i[index show]
      before_action :set_style, only: %i[show]

      def index
        @users = policy_scope(User)
      end

      def show; end

      private

      def set_style
        @user = User.find(params[:id])
        authorize @user  # For Pundit
      end

      def style_params
        params.require(:style).permit(:name, :description)
      end

      def render_error
        render json: { errors: @style.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  end
end
