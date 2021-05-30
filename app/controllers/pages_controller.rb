class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home men women search]

  def home
  end

  def men
  end

  def women
  end

  def search
  end
end
