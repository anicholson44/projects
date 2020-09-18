class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :school_name
      t.string :description
      t.date :phase_actual_start_date
      t.date :phase_planned_end_date
      t.date :phase_actual_end_date
      t.float :budget
      t.float :final_estimate_of_actual_costs
      t.float :total_phase_actual_spending

      t.index :school_name
      t.index :description
      t.index :phase_actual_start_date
      t.index :phase_planned_end_date
      t.index :phase_actual_end_date
      t.index :budget
      t.index :final_estimate_of_actual_costs
      t.index :total_phase_actual_spending

      t.timestamps
    end
  end
end
