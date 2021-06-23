class Api::V1::StylesController < Api::V1::BaseController

  def index
    @styles = policy_scope(Style)
  end
end
