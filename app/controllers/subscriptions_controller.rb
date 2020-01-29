class SubscriptionsController < ApplicationController
  def new
    @project = Project.find(params[:project])
  end

  def create
  end

  def destroy
  end
end
