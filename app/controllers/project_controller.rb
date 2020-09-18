class ProjectController < ApplicationController
  def index
    @projects = Project
      .search(params[:search])
      .where(filter_params)
      .page(params[:page] || 1)
      .per(params[:per_page] || 25)
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(update_params)
      render :update
    else
      render :update, status: :unprocessable_entity
    end
  end

  private def filter_params
    params.permit(
      :phase_actual_start_date,
      :phase_planned_end_date,
      :phase_actual_end_date,
      :budget,
      :final_estimate_of_actual_costs,
      :total_phase_actual_spending
    ).to_h
  end

  private def update_params
    params.permit(
      :phase_actual_start_date,
      :total_phase_actual_spending
    )
  end
end
