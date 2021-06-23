module Api
  module V1
    class StylesController < Api::V1::BaseController
      acts_as_token_authentication_handler_for User, except: %i[index show]
      before_action :set_style, only: %i[show update destroy]

      def index
        @styles = policy_scope(Style)
      end

      def show; end

      def update
        if @style.update(style_params)
          render :show
        else
          render_error
        end
      end

      def destroy
        @restaurant.destroy
        head :no_content
        # No need to create a `destroy.json.jbuilder` view
      end

      private

      def set_style
        @style = Style.find(params[:id])
        authorize @style  # For Pundit
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
