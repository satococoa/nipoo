class PagesController < ApplicationController
  before_filter :go_reports
  def index
  end

  private
  def go_reports
    redirect_to :reports if logged_in?
  end
end
