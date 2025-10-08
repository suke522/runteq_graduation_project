class WorksController < ApplicationController
  def index
    @works = Work.includes(:user)
  end
end
