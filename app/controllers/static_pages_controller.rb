class StaticPagesController < ApplicationController
  before_action :logged_in?, only: :home

  def home
    @user = current_user
  end
end