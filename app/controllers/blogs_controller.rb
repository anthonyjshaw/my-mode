class BlogsController < ApplicationController
  def index
    @blogs = policy_scope(Blog)
  end
end
