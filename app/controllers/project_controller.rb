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
      :phase_actual_start_date,
      :phase_planned_end_date,
      :phase_planned_end_date,
      :budget,
      :final_estimate_of_actual_costs,
      :total_phase_actual_spending
    ).to_h
  end
end
