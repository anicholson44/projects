class ProjectController < ApplicationController
  def index
    @projects = Project
      .search(params[:search])
      .where(filter_params)
  end

  def update
  end

  private def filter_params
    params.permit(
      :phase_actual_start_date
    ).to_h
  end
end
