class ProjectController < ApplicationController
  def index
    @projects = Project.search(params[:search])
  end

  def update
  end

  private def search_params

  end
end
