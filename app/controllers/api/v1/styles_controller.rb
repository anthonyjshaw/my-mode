module Api
  module V1
    class StylesController < Api::V1::BaseController
      before_action :set_style, only: [:show]

      def index
        @styles = policy_scope(Style)
      end

      def show; end

      private

      def set_style
        @style = Style.find(params[:id])
        authorize @style  # For Pundit
      end
    end
  end
end
