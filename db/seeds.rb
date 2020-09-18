# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fixture = File.read(Rails.root.join('db/fixtures/dataset.json'))
data = JSON.parse(fixture)

data.each do |p|
  Project.create!(
    school_name: p["Project School Name"],
    description: p["Project Description"],
    phase_actual_start_date: p["Project Phase Actual Start Date"],
    phase_planned_end_date: p["Project Phase Planned End Date"],
    phase_actual_end_date: p["Project Phase Actual End Date"],
    budget: p["Project Budget Amount"],
    final_estimate_of_actual_costs: p["Final Estimate of Actual Costs Through End of Phase Amount"],
    total_phase_actual_spending: p["Total Phase Actual Spending Amount"]
  )
end
