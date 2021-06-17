class StylesController < ApplicationController

  def index
    @styles = policy_scope(Style).all
  end
end
