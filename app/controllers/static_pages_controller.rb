class StaticPagesController < ApplicationController
  before_action :logged_in?

  def home
    @user = current_user
  end
end