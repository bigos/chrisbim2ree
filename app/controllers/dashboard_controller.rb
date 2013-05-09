class DashboardController < ApplicationController
  before_filter :require_admin

  def show
    respond_to do |format|
      format.html
    end
  end
end
